#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mount.h>
#include <sys/sysmacros.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <dirent.h>

#define RESCUE_SHELL "/bin/sh"

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

static int is_symlink(const char *path) {
    struct stat st;
    if (lstat(path, &st) == -1) return 0;
    return S_ISLNK(st.st_mode);
}

static void create_virtio_nodes(void) {
    const char *base = "/dev/vd";
    char path[64];
    for (int i = 0; i < 16; ++i) {
        snprintf(path, sizeof(path), "%sa%d", base, i);
        if (mknod(path, S_IFBLK | 0600, makedev(254, i)) == -1 && errno != EEXIST) perror(path);
    }
}

static const char *find_root(void) {
    const char *roots[] = {"/dev/vda", "/dev/vda1", "/dev/vda2", "/dev/vdb", "/dev/vdb1", NULL};
    for (int i = 0; roots[i]; ++i) {
        FILE *f = fopen(roots[i], "r");
        if (f) { fclose(f); return roots[i]; }
    }
    return NULL;
}

static void switch_root(const char *new_root) {
    const char *target = "/new_root";
    char proc_path[256];
    char sys_path[256];
    char dev_path[256];
    if (mkdir(target, 0755) == -1 && errno != EEXIST) perror("mkdir /new_root");
    if (mount(new_root, target, "ext4", MS_NOATIME | MS_RELATIME, NULL) == -1) panic("mount rootfs");
    snprintf(proc_path, sizeof(proc_path), "%s/proc", target);
    snprintf(sys_path, sizeof(sys_path), "%s/sys", target);
    snprintf(dev_path, sizeof(dev_path), "%s/dev", target);
    mount("proc", proc_path, "proc", MS_MOVE, NULL);
    mount("sysfs", sys_path, "sysfs", MS_MOVE, NULL);
    if (mount("dev", dev_path, NULL, MS_MOVE, NULL) == -1) perror("move /dev");
    if (chdir(target) == -1) panic("chdir");
    if (chroot(".") == -1) panic("chroot");
}

static void dump_parts(void) {
    FILE *f = fopen("/proc/partitions", "r");
    if (!f) return;
    char line[256];
    while (fgets(line, sizeof(line), f)) {
        write(STDERR_FILENO, line, strlen(line));
    }
    fclose(f);
}

int main(void) {
    message("--- Geometry Linux Init ---");

    mount_proc_sys_dev();
    create_virtio_nodes();

    const char *root_dev = find_root();
    if (!root_dev) {
        message("No root device found.");
        dump_parts();
        panic("cannot find root");
    }
    message(root_dev);

    switch_root(root_dev);
    message("Switching root...");

    if (access("/sbin/init", X_OK) == 0) {
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

    panic("no init or shell");
    return 1;
}