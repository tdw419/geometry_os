// Linux syscall test suite for Ubuntu RISC-V guest
// Exercises standard Linux syscalls via libc wrappers
//
// Compile for RISC-V64:
//   riscv64-linux-gnu-gcc -static -o linux_syscalls_test_rv64 linux_syscalls_test.c
//
// Run in Ubuntu guest:
//   ./linux_syscalls_test_rv64

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>
#include <time.h>

int tests_run = 0;
int tests_passed = 0;

void test_start(const char *name) {
    printf("[TEST] %s\n", name);
    tests_run++;
}

void test_pass(void) {
    printf("  PASS\n");
    tests_passed++;
}

void test_fail(const char *reason) {
    printf("  FAIL: %s\n", reason);
}

int test_end(void) {
    printf("\n=== SUMMARY ===\n");
    printf("Total: %d\n", tests_run);
    printf("Passed: %d\n", tests_passed);
    printf("Failed: %d\n", tests_run - tests_passed);
    return tests_passed == tests_run ? 0 : 1;
}

// ── File I/O Tests ──
void test_open_read_write_close(void) {
    test_start("open_read_write_close");
    
    int fd = open("test_file.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        test_fail("open failed");
        return;
    }
    
    const char *data = "Hello, Ubuntu!";
    ssize_t written = write(fd, data, strlen(data));
    if (written < 0) {
        close(fd);
        test_fail("write failed");
        return;
    }
    close(fd);
    
    // Read back
    fd = open("test_file.txt", O_RDONLY);
    if (fd < 0) {
        test_fail("open for read failed");
        return;
    }
    
    char buf[32] = {0};
    ssize_t bytes = read(fd, buf, sizeof(buf) - 1);
    if (bytes < 0) {
        close(fd);
        test_fail("read failed");
        return;
    }
    close(fd);
    
    if (strcmp(buf, data) != 0) {
        test_fail("data mismatch");
        return;
    }
    
    unlink("test_file.txt");
    test_pass();
}

void test_stat(void) {
    test_start("stat");
    
    int fd = open("test_stat.txt", O_WRONLY | O_CREAT, 0644);
    if (fd < 0) {
        test_fail("create file failed");
        return;
    }
    close(fd);
    
    struct stat st;
    if (stat("test_stat.txt", &st) < 0) {
        test_fail("stat failed");
        unlink("test_stat.txt");
        return;
    }
    
    if (!S_ISREG(st.st_mode)) {
        test_fail("not a regular file");
        unlink("test_stat.txt");
        return;
    }
    
    unlink("test_stat.txt");
    test_pass();
}

void test_lseek(void) {
    test_start("lseek");
    
    int fd = open("test_lseek.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        test_fail("open failed");
        return;
    }
    
    const char *data = "0123456789";
    write(fd, data, strlen(data));
    
    // Seek to beginning
    off_t pos = lseek(fd, 0, SEEK_SET);
    if (pos != 0) {
        close(fd);
        test_fail("SEEK_SET failed");
        unlink("test_lseek.txt");
        return;
    }
    
    // Seek to end
    pos = lseek(fd, 0, SEEK_END);
    if (pos != 10) {
        close(fd);
        test_fail("SEEK_END failed");
        unlink("test_lseek.txt");
        return;
    }
    
    close(fd);
    unlink("test_lseek.txt");
    test_pass();
}

// ── Directory Tests ──
void test_mkdir_rmdir(void) {
    test_start("mkdir_rmdir");
    
    if (mkdir("testdir", 0755) < 0) {
        test_fail("mkdir failed");
        return;
    }
    
    // Should fail - already exists
    if (mkdir("testdir", 0755) == 0) {
        test_fail("mkdir should fail on existing dir");
        rmdir("testdir");
        return;
    }
    
    if (rmdir("testdir") < 0) {
        test_fail("rmdir failed");
        return;
    }
    
    // Should fail - doesn't exist
    if (rmdir("testdir") == 0) {
        test_fail("rmdir should fail on non-existent dir");
        return;
    }
    
    test_pass();
}

void test_chdir_getcwd(void) {
    test_start("chdir_getcwd");
    
    if (mkdir("testdir_chdir", 0755) < 0) {
        test_fail("mkdir failed");
        return;
    }
    
    char original_cwd[256] = {0};
    if (getcwd(original_cwd, sizeof(original_cwd)) == NULL) {
        test_fail("getcwd failed");
        rmdir("testdir_chdir");
        return;
    }
    
    if (chdir("testdir_chdir") < 0) {
        test_fail("chdir failed");
        rmdir("testdir_chdir");
        return;
    }
    
    char new_cwd[256] = {0};
    if (getcwd(new_cwd, sizeof(new_cwd)) == NULL) {
        chdir(original_cwd);
        rmdir("testdir_chdir");
        test_fail("getcwd after chdir failed");
        return;
    }
    
    if (strcmp(new_cwd + strlen(new_cwd) - strlen("testdir_chdir"), "testdir_chdir") != 0) {
        chdir(original_cwd);
        rmdir("testdir_chdir");
        test_fail("cwd not updated correctly");
        return;
    }
    
    chdir(original_cwd);
    rmdir("testdir_chdir");
    test_pass();
}

// ── Process Tests ──
void test_getpid(void) {
    test_start("getpid");
    
    pid_t pid = getpid();
    if (pid <= 0) {
        test_fail("getpid returned invalid pid");
        return;
    }
    
    pid_t ppid = getppid();
    if (ppid <= 0) {
        test_fail("getppid returned invalid pid");
        return;
    }
    
    test_pass();
}

void test_fork_wait(void) {
    test_start("fork_wait");
    
    pid_t pid = fork();
    if (pid < 0) {
        test_fail("fork failed");
        return;
    }
    
    if (pid == 0) {
        // Child process
        exit(42);  // Exit with specific code
    }
    
    // Parent process
    int status;
    pid_t waited = wait(&status);
    if (waited != pid) {
        test_fail("wait returned wrong pid");
        return;
    }
    
    if (!WIFEXITED(status)) {
        test_fail("child did not exit normally");
        return;
    }
    
    if (WEXITSTATUS(status) != 42) {
        test_fail("child exit status wrong");
        return;
    }
    
    test_pass();
}

// ── File Descriptor Tests ──
void test_dup_dup2(void) {
    test_start("dup_dup2");
    
    int fd = open("test_dup.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        test_fail("open failed");
        return;
    }
    
    int dup_fd = dup(fd);
    if (dup_fd < 0) {
        close(fd);
        test_fail("dup failed");
        return;
    }
    
    // dup2 to a specific fd
    int dup2_fd = dup2(fd, 100);
    if (dup2_fd != 100) {
        close(fd);
        close(dup_fd);
        test_fail("dup2 returned wrong fd");
        return;
    }
    
    close(fd);
    close(dup_fd);
    close(dup2_fd);
    unlink("test_dup.txt");
    test_pass();
}

// ── Time Tests ──
void test_time(void) {
    test_start("time");
    
    time_t now = time(NULL);
    if (now < 0) {
        test_fail("time failed");
        return;
    }
    
    struct timespec ts;
    if (clock_gettime(CLOCK_REALTIME, &ts) < 0) {
        test_fail("clock_gettime failed");
        return;
    }
    
    test_pass();
}

void test_nanosleep(void) {
    test_start("nanosleep");
    
    struct timespec req = { .tv_sec = 0, .tv_nsec = 100000000 };  // 100ms
    struct timespec rem;
    
    if (nanosleep(&req, &rem) < 0) {
        test_fail("nanosleep failed");
        return;
    }
    
    test_pass();
}

// ── Unlink Test ──
void test_unlink(void) {
    test_start("unlink");
    
    int fd = open("test_unlink.txt", O_WRONLY | O_CREAT, 0644);
    if (fd < 0) {
        test_fail("create file failed");
        return;
    }
    close(fd);
    
    if (unlink("test_unlink.txt") < 0) {
        test_fail("unlink failed");
        return;
    }
    
    // Should fail - file doesn't exist
    if (unlink("test_unlink.txt") == 0) {
        test_fail("unlink should fail on non-existent file");
        return;
    }
    
    test_pass();
}

int main(int argc, char **argv) {
    printf("=== Linux Syscall Test Suite for RISC-V Ubuntu ===\n\n");
    
    // File I/O tests
    test_open_read_write_close();
    test_stat();
    test_lseek();
    
    // Directory tests
    test_mkdir_rmdir();
    test_chdir_getcwd();
    
    // Process tests
    test_getpid();
    test_fork_wait();
    
    // File descriptor tests
    test_dup_dup2();
    
    // Time tests
    test_time();
    test_nanosleep();
    
    // Unlink test
    test_unlink();
    
    return test_end();
}