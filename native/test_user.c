// test_user.c - Minimal xv6 user program for testing Sv32 translation
// No syscalls, just returns a value to verify U-mode execution works

int main(void) {
    // Simple arithmetic to verify we're executing in U-mode
    int x = 42;
    int y = x * 2;
    
    // Volatile to prevent optimization
    volatile int result = y + 10;
    
    // Return 0 (exit syscall wrapper will handle this)
    return result == 94 ? 0 : 1;
}