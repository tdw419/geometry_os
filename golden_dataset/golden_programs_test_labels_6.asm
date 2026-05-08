; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it generates random numbers, performs modular arithmetic to categorize them, and stores the results in memory. The loop continues until a specific condition is met, at which point the program halts.

; Test label resolution
    LDI r3, 1
    LDI r20, 64
loop_start:
    RAND r5
    LDI r0, 3
    MOD r5, r0
    CMPI r5, 0
    JNZ r10, mid_case
    CMPI r5, 1
    JNZ r10, dark_case
    LDI r5, 1
    JMP store_it
mid_case:
    LDI r5, 2
    JMP store_it
dark_case:
    LDI r5, 3
store_it:
    STORE r20, r5
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r10, loop_start
    HALT
