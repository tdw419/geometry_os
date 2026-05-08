; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it generates random numbers, performs modular arithmetic to categorize them, and stores the results in memory. The loop continues until a specific condition is met, at which point the program halts.

; Test label resolution
    LDI r8, 1
    LDI r20, 64
loop_start:
    RAND r15
    LDI r5, 3
    MOD r15, r5
    CMPI r15, 0
    JNZ r10, mid_case
    CMPI r15, 1
    JNZ r10, dark_case
    LDI r15, 1
    JMP store_it
mid_case:
    LDI r15, 2
    JMP store_it
dark_case:
    LDI r15, 3
store_it:
    STORE r20, r15
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r10, loop_start
    HALT
