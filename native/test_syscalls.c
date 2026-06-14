// Pixel-native syscall test suite
// Exercises mkdir, rmdir, chdir, getcwd, dup2, openat, close, read, write, unlink
//
// Compile:
//   cd native && bash build_test_syscalls.sh
//
// Run through hypervisor:
//   cargo run -- --kernel native/test_syscalls

// Minimal syscalls we need
#define SYS_write 64
#define SYS_exit 93
#define SYS_mkdir 83
#define SYS_rmdir 84
#define SYS_chdir 49
#define SYS_getcwd 17
#define SYS_dup2 24
#define SYS_openat 56
#define SYS_close 57
#define SYS_read 63
#define SYS_unlink 87

// Linux open flags
#define O_RDONLY 0
#define O_WRONLY 1
#define O_RDWR 2
#define O_CREAT 64
#define O_TRUNC 512

// AT_FDCWD for openat
#define AT_FDCWD (-100)

// Simple I/O helpers
void write_str(const char *s) {
    int len = 0;
    while (s[len]) len++;
    asm volatile(
        "mv a7, %0\n"
        "mv a0, %1\n"
        "mv a1, %2\n"
        "mv a2, %3\n"
        "ecall\n"
        :
        : "r"((long)SYS_write), "r"(1L), "r"((long)s), "r"((long)len)
        : "a0", "a1", "a2", "a7", "memory"
    );
}

void write_int(int val) {
    char buf[32];
    int i = 30;
    int negative = val < 0;
    unsigned int uval = negative ? -val : val;

    buf[31] = '\n';
    do {
        buf[i--] = '0' + (uval % 10);
        uval /= 10;
    } while (uval > 0);

    if (negative) buf[i--] = '-';

    asm volatile(
        "mv a7, %0\n"
        "mv a0, %1\n"
        "mv a1, %2\n"
        "mv a2, %3\n"
        "ecall\n"
        :
        : "r"((long)SYS_write), "r"(1L), "r"((long)(buf + i + 1)), "r"((long)(31 - i))
        : "a0", "a1", "a2", "a7", "memory"
    );
}

void exit(int code) {
    asm volatile(
        "mv a7, %0\n"
        "mv a0, %1\n"
        "ecall\n"
        :
        : "r"((long)SYS_exit), "r"((long)code)
        : "a0", "a7", "memory"
    );
    while (1) {}
}

// Syscall wrappers
int syscall_mkdir(const char *pathname, int mode) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "mv a1, %3\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_mkdir), "r"((long)pathname), "r"((long)mode)
        : "a0", "a1", "a7", "memory"
    );
    return (int)ret;
}

int syscall_rmdir(const char *pathname) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_rmdir), "r"((long)pathname)
        : "a0", "a7", "memory"
    );
    return (int)ret;
}

int syscall_chdir(const char *pathname) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_chdir), "r"((long)pathname)
        : "a0", "a7", "memory"
    );
    return (int)ret;
}

char *syscall_getcwd(char *buf, unsigned long size) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "mv a1, %3\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_getcwd), "r"((long)buf), "r"((long)size)
        : "a0", "a1", "a7", "memory"
    );
    return (char *)ret;
}

int syscall_dup2(int oldfd, int newfd) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "mv a1, %3\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_dup2), "r"((long)oldfd), "r"((long)newfd)
        : "a0", "a1", "a7", "memory"
    );
    return (int)ret;
}

int syscall_openat(int dirfd, const char *pathname, int flags, int mode) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "mv a1, %3\n"
        "mv a2, %4\n"
        "mv a3, %5\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_openat), "r"((long)dirfd), "r"((long)pathname),
          "r"((long)flags), "r"((long)mode)
        : "a0", "a1", "a2", "a3", "a7", "memory"
    );
    return (int)ret;
}

int syscall_close(int fd) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_close), "r"((long)fd)
        : "a0", "a7", "memory"
    );
    return (int)ret;
}

long syscall_read(int fd, void *buf, unsigned long count) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "mv a1, %3\n"
        "mv a2, %4\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_read), "r"((long)fd), "r"((long)buf), "r"((long)count)
        : "a0", "a1", "a2", "a7", "memory"
    );
    return ret;
}

long syscall_write(int fd, const void *buf, unsigned long count) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "mv a1, %3\n"
        "mv a2, %4\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_write), "r"((long)fd), "r"((long)buf), "r"((long)count)
        : "a0", "a1", "a2", "a7", "memory"
    );
    return ret;
}

int syscall_unlink(const char *pathname) {
    long ret;
    asm volatile(
        "mv a7, %1\n"
        "mv a0, %2\n"
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"((long)SYS_unlink), "r"((long)pathname)
        : "a0", "a7", "memory"
    );
    return (int)ret;
}

// String helpers
int str_eq(const char *a, const char *b) {
    while (*a && *a == *b) {
        a++;
        b++;
    }
    return *a == *b;
}

int str_len(const char *s) {
    int len = 0;
    while (s[len]) len++;
    return len;
}

// Test framework
int tests_run = 0;
int tests_passed = 0;

void test_start(const char *name) {
    write_str("[TEST] ");
    write_str(name);
    write_str("\n");
    tests_run++;
}

void test_pass(void) {
    write_str("  PASS\n");
    tests_passed++;
}

void test_fail(const char *reason) {
    write_str("  FAIL: ");
    write_str(reason);
    write_str("\n");
}

int test_end(void) {
    write_str("\n=== SUMMARY ===\n");
    write_str("Total: ");
    write_int(tests_run);
    write_str("Passed: ");
    write_int(tests_passed);
    write_str("Failed: ");
    write_int(tests_run - tests_passed);
    return tests_passed == tests_run ? 0 : 1;
}

// ── Directory Tests ──

void test_mkdir_create(void) {
    test_start("mkdir_create");

    int ret = syscall_mkdir("testdir_mkdir", 0755);
    if (ret < 0) {
        test_fail("mkdir returned error");
        return;
    }

    // Try to create same directory again - should fail
    ret = syscall_mkdir("testdir_mkdir", 0755);
    if (ret >= 0) {
        test_fail("mkdir should fail on existing directory");
        return;
    }

    // Cleanup
    syscall_rmdir("testdir_mkdir");
    test_pass();
}

void test_rmdir_remove(void) {
    test_start("rmdir_remove");

    int ret = syscall_mkdir("testdir_rmdir", 0755);
    if (ret < 0) {
        test_fail("setup: mkdir failed");
        return;
    }

    ret = syscall_rmdir("testdir_rmdir");
    if (ret < 0) {
        test_fail("rmdir returned error");
        return;
    }

    // Try to remove again - should fail
    ret = syscall_rmdir("testdir_rmdir");
    if (ret >= 0) {
        test_fail("rmdir should fail on non-existent directory");
        return;
    }

    test_pass();
}

void test_chdir_simple(void) {
    test_start("chdir_simple");

    int ret = syscall_mkdir("testdir_chdir", 0755);
    if (ret < 0) {
        test_fail("setup: mkdir failed");
        return;
    }

    ret = syscall_chdir("testdir_chdir");
    if (ret < 0) {
        syscall_rmdir("testdir_chdir");
        test_fail("chdir returned error");
        return;
    }

    // Change back to root
    syscall_chdir("/");

    // Cleanup
    syscall_rmdir("testdir_chdir");
    test_pass();
}

void test_getcwd_basic(void) {
    test_start("getcwd_basic");

    int ret = syscall_mkdir("homedir", 0755);
    if (ret < 0) {
        test_fail("setup: mkdir failed");
        return;
    }

    ret = syscall_chdir("homedir");
    if (ret < 0) {
        syscall_rmdir("homedir");
        test_fail("setup: chdir failed");
        return;
    }

    char buf[256];
    char *cwd = syscall_getcwd(buf, sizeof(buf));
    if (!cwd || cwd != buf) {
        syscall_chdir("/");
        syscall_rmdir("homedir");
        test_fail("getcwd returned NULL or wrong pointer");
        return;
    }

    if (!str_eq(buf, "homedir")) {
        syscall_chdir("/");
        syscall_rmdir("homedir");
        test_fail("getcwd returned wrong directory");
        return;
    }

    // Cleanup
    syscall_chdir("/");
    syscall_rmdir("homedir");
    test_pass();
}

void test_dup2_basic(void) {
    test_start("dup2_basic");

    // dup2(1, 10) should duplicate stdout to fd 10
    int ret = syscall_dup2(1, 10);
    if (ret < 0) {
        test_fail("dup2 returned error");
        return;
    }

    if (ret != 10) {
        test_fail("dup2 should return new fd");
        return;
    }

    // Write to fd 10 - should appear on stdout
    const char *msg = "dup2_write";
    int len = 10;
    asm volatile(
        "mv a7, %0\n"
        "mv a0, %1\n"
        "mv a1, %2\n"
        "ecall\n"
        :
        : "r"((long)SYS_write), "r"(10L), "r"((long)msg), "r"((long)len)
        : "a0", "a1", "a7", "memory"
    );

    test_pass();
}

// ── File I/O Tests ──

void test_openat_open(void) {
    test_start("openat_open");

    // Try to open a non-existent file
    int fd = syscall_openat(AT_FDCWD, "nonexistent.txt", O_RDONLY, 0);
    if (fd >= 0) {
        test_fail("openat should fail for non-existent file");
        return;
    }

    test_pass();
}

void test_close_basic(void) {
    test_start("close_basic");

    // Try to close an invalid fd
    int ret = syscall_close(-1);
    if (ret >= 0) {
        test_fail("close should fail for invalid fd");
        return;
    }

    // Close stdin/stdout/stderr should succeed or be no-op
    syscall_close(0);
    syscall_close(1);
    syscall_close(2);

    test_pass();
}

void test_read_invalid_fd(void) {
    test_start("read_invalid_fd");

    char buf[10];
    long ret = syscall_read(-1, buf, sizeof(buf));
    if (ret >= 0) {
        test_fail("read should fail for invalid fd");
        return;
    }

    // Read from stdin/stdout/stderr may fail or return 0
    syscall_read(0, buf, sizeof(buf));
    syscall_read(1, buf, sizeof(buf));
    syscall_read(2, buf, sizeof(buf));

    test_pass();
}

void test_unlink_nonexistent(void) {
    test_start("unlink_nonexistent");

    // Try to unlink non-existent file
    int ret = syscall_unlink("nonexistent_file.txt");
    if (ret >= 0) {
        test_fail("unlink should fail for non-existent file");
        return;
    }

    test_pass();
}

void test_file_lifecycle(void) {
    test_start("file_lifecycle");

    // Open file for writing
    int fd = syscall_openat(AT_FDCWD, "test_lifecycle.txt", O_WRONLY | O_CREAT, 0644);
    if (fd < 0) {
        test_fail("openat for write failed");
        return;
    }

    const char *write_msg = "GeometryOS VFS Writing!";
    int write_len = str_len(write_msg);
    long bytes_written = syscall_write(fd, write_msg, write_len);
    if (bytes_written != write_len) {
        syscall_close(fd);
        test_fail("write bytes count mismatch");
        return;
    }

    syscall_close(fd);

    // Open file for reading
    fd = syscall_openat(AT_FDCWD, "test_lifecycle.txt", O_RDONLY, 0);
    if (fd < 0) {
        test_fail("openat for read failed");
        return;
    }

    char read_buf[64];
    for (int i = 0; i < 64; i++) {
        read_buf[i] = 0;
    }

    long bytes_read = syscall_read(fd, read_buf, sizeof(read_buf));
    if (bytes_read != write_len) {
        syscall_close(fd);
        test_fail("read bytes count mismatch");
        return;
    }

    if (!str_eq(read_buf, write_msg)) {
        syscall_close(fd);
        test_fail("read contents do not match written data");
        return;
    }

    syscall_close(fd);

    // Cleanup
    int ret = syscall_unlink("test_lifecycle.txt");
    if (ret < 0) {
        test_fail("unlink failed");
        return;
    }

    test_pass();
}

// ── Main ──

int main(void) {
    write_str("\n=== Pixel-Native Syscall Tests ===\n");
    write_str("Testing hypervisor syscall implementation\n\n");

    // Directory management tests
    test_mkdir_create();
    test_rmdir_remove();
    test_chdir_simple();
    test_getcwd_basic();
    test_dup2_basic();

    // File I/O tests
    test_openat_open();
    test_close_basic();
    test_read_invalid_fd();
    test_unlink_nonexistent();
    test_file_lifecycle();

    int result = test_end();
    exit(result);
    return result;
}