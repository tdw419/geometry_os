#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/mount.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <dirent.h>

#define RESCUE_SHELL "/bin/sh"

static void message(const char *msg);
static void panic(const char *msg);
static void mount_proc_sys_dev(void);
static void probe_virtio(void);
static const char *find_root(void);
static void switch_root(const char *new_root);
static void dump_parts(void);
static void list_dev(void);

static void message(const char *msg) {
    write(STDOUT_FILENO, msg, strlen(msg));
    write(STDOUT_FILENO, "\n", 1);
}

static void panic(const char *msg) {
    const char *prefix = "PANIC: ";
    write(STDERR_FILENO, prefix, strlen(prefix));
    write(STDERR_FILENO, msg, strlen(msg));
    write(STDERR_FILENO, "\n", 1);
    while (1) sleep(1);
}

static void mount_proc_sys_dev(void) {
    if (mkdir("/proc", 0755) == -1 && errno != EEXIST) panic("mkdir /proc");
    if (mount("proc", "/proc", "proc", 0, NULL) == -1) perror("mount proc");
    
    if (mkdir("/sys", 0755) == -1 && errno != EEXIST) panic("mkdir /sys");
    if (mount("sysfs", "/sys", "sysfs", 0, NULL) == -1) perror("mount sysfs");
    
    if (mkdir("/dev", 0755) == -1 && errno != EEXIST) panic("mkdir /dev");
    if (mount("devtmpfs", "/dev", "devtmpfs", 0, NULL) == -1) perror("mount dev");
}

static void probe_virtio(void) {
    message("Probing sysfs for virtio devices...");
    
    DIR *sys_block = opendir("/sys/block");
    if (!sys_block) {
        message("Cannot open /sys/block");
        return;
    }
    
    struct dirent *entry;
    int found_devices = 0;
    
    while ((entry = readdir(sys_block)) != NULL) {
        if (strncmp(entry->d_name, "vd", 2) == 0) {
            char msg[256];
            snprintf(msg, sizeof(msg), "Found block device: %s", entry->d_name);
            message(msg);
            found_devices++;
            
            // Check if it's a virtio device
            char virtio_path[512];
            snprintf(virtio_path, sizeof(virtio_path), "/sys/block/%s/device/virtio%u", 
                     entry->d_name, 0);
            
            DIR *virtio_dir = opendir(virtio_path);
            if (virtio_dir) {
                message("  -> Virtio device detected");
                closedir(virtio_dir);
            }
        }
    }
    
    closedir(sys_block);
    
    if (found_devices == 0) {
        message("No virtio-blk devices found in /sys/block");
        message("Checking /sys/class/block...");
        
        DIR *class_block = opendir("/sys/class/block");
        if (class_block) {
            while ((entry = readdir(class_block)) != NULL) {
                if (strncmp(entry->d_name, "vd", 2) == 0) {
                    char msg[256];
                    snprintf(msg, sizeof(msg), "Found in class: %s", entry->d_name);
                    message(msg);
                    found_devices++;
                }
            }
            closedir(class_block);
        }
    }
    
    if (found_devices > 0) {
        char msg[128];
        snprintf(msg, sizeof(msg), "Total virtio devices found: %d", found_devices);
        message(msg);
    } else {
        message("ERROR: No virtio-blk devices found at all!");
        message("This usually means virtio-blk driver is not loaded or not supported by kernel");
    }
}

static const char *find_root(void) {
    const char *roots[] = {
        "/dev/vda",      // Whole device first
        "/dev/vda1",     // First partition
        "/dev/vda2",
        "/dev/vdb",      // Second disk
        "/dev/vdb1",
        NULL
    };
    
    // Retry multiple times to allow virtio driver to create devices
    for (int attempt = 0; attempt < 30; ++attempt) {
        if (attempt % 5 == 0) {
            probe_virtio();
        }
        
        for (int i = 0; roots[i]; ++i) {
            struct stat st;
            if (lstat(roots[i], &st) == 0 && S_ISBLK(st.st_mode)) {
                message("Trying device:");
                message(roots[i]);
                
                int fd = open(roots[i], O_RDONLY | O_NONBLOCK);
                if (fd >= 0) {
                    close(fd);
                    message("Successfully opened root device:");
                    message(roots[i]);
                    return roots[i];
                } else {
                    message("Failed to open (may not be a real device)");
                }
            }
        }
        
        if (attempt < 29) {
            message("Root device not ready, retrying...");
            sleep(1);
        }
    }
    
    return NULL;
}

static void switch_root(const char *new_root) {
    const char *target = "/new_root";
    char proc_path[256];
    char sys_path[256];
    char dev_path[256];
    
    if (mkdir(target, 0755) == -1 && errno != EEXIST) perror("mkdir /new_root");
    
    message("Mounting root filesystem...");
    if (mount(new_root, target, "ext4", MS_NOATIME | MS_RELATIME, NULL) == -1) {
        perror("mount rootfs");
        dump_parts();
        panic("mount rootfs");
    }
    
    snprintf(proc_path, sizeof(proc_path), "%s/proc", target);
    snprintf(sys_path, sizeof(sys_path), "%s/sys", target);
    snprintf(dev_path, sizeof(dev_path), "%s/dev", target);
    
    message("Moving filesystems...");
    if (mount("proc", proc_path, "proc", MS_MOVE, NULL) == -1) {
        perror("move /proc");
    }
    
    if (mount("sysfs", sys_path, "sysfs", MS_MOVE, NULL) == -1) {
        perror("move /sys");
    }
    
    if (mount("dev", dev_path, NULL, MS_MOVE, NULL) == -1) {
        perror("move /dev");
    }
    
    message("Changing root...");
    if (chdir(target) == -1) {
        panic("chdir");
    }
    
    if (chroot(".") == -1) {
        panic("chroot");
    }
}

static void dump_parts(void) {
    FILE *f = fopen("/proc/partitions", "r");
    if (!f) return;
    
    char line[256];
    message("Available partitions:");
    while (fgets(line, sizeof(line), f)) {
        write(STDERR_FILENO, line, strlen(line));
    }
    fclose(f);
}

static void list_dev(void) {
    DIR *d = opendir("/dev");
    if (!d) return;
    
    message("Devices in /dev:");
    struct dirent *entry;
    while ((entry = readdir(d)) != NULL) {
        if (strncmp(entry->d_name, "vd", 2) == 0) {
            char msg[128];
            snprintf(msg, sizeof(msg), "  /dev/%s", entry->d_name);
            message(msg);
        }
    }
    closedir(d);
}

int main(void) {
    message("--- Geometry Linux Init ---");
    
    mount_proc_sys_dev();
    
    // Give virtio driver time to create devices
    message("Waiting for virtio-blk devices...");
    sleep(3);
    
    message("Scanning for root device...");
    list_dev();
    
    const char *root_dev = find_root();
    if (!root_dev) {
        message("No root device found after retries.");
        dump_parts();
        panic("cannot find root");
    }
    
    switch_root(root_dev);
    
    if (access("/sbin/init", X_OK) == 0) {
        message("Executing /sbin/init...");
        char *argv[] = {"/sbin/init", NULL};
        execve("/sbin/init", argv, NULL);
        perror("execve /sbin/init");
    }
    
    if (access("/bin/sh", X_OK) == 0) {
        message("Falling back to /bin/sh");
        char *argv[] = {"/bin/sh", NULL};
        execve("/bin/sh", argv, NULL);
        perror("execve /bin/sh");
    }
    
    panic("no init or shell found");
    return 1;
}