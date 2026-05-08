; DESCRIPTION: This GeOS assembly code tests the SHL (shift left) and SHR (shift right) opcodes by performing various shift operations on different values and storing the results in memory locations from 0x0200 to 0x0205. The tests cover basic shifts, shifts by zero, handling of large shift amounts using modulo operation, logical shifts without sign extension, and reconstructing a value through shifting.

; shift_test.asm -- Test SHL and SHR opcodes
;
; Tests:
;   1 << 4 = 16  (SHL basic)
;   16 >> 2 = 4  (SHR basic)
;   5 << 0 = 5   (SHL by zero)
;   1 << 36 = 1 << 4 = 16  (shift amount mod 32)
;   0xFFFF >> 1 = 0x7FFF  (logical shift right, no sign extension)

; Test 1 -- SHL basic -- r5 = 1 << 4 = 16
LDI r5, 1
LDI r4, 4
SHL r5, r4
LDI r30, 0x0200
STORE r30, r5     ; RAM[0x0200] = 16

; Test 2 -- SHR basic -- r5 = 16 >> 2 = 4
LDI r5, 16
LDI r4, 2
SHR r5, r4
LDI r30, 0x0201
STORE r30, r5     ; RAM[0x0201] = 4

; Test 3 -- SHL by zero -- r5 = 5 << 0 = 5
LDI r5, 5
LDI r4, 0
SHL r5, r4
LDI r30, 0x0202
STORE r30, r5     ; RAM[0x0202] = 5

; Test 4 -- SHL with large shift (mod 32) -- r5 = 1 << (36 % 32) = 1 << 4 = 16
LDI r5, 1
LDI r4, 36
SHL r5, r4
LDI r30, 0x0203
STORE r30, r5     ; RAM[0x0203] = 16

; Test 5 -- SHR logical -- r5 = 0xFFFF >> 1 = 0x7FFF (no sign extension)
LDI r5, 0xFFFF
LDI r4, 1
SHR r5, r4
LDI r30, 0x0204
STORE r30, r5     ; RAM[0x0204] = 0x7FFF

; Test 6 -- SHL to reconstruct -- (1 << 8) >> 4 = 16
LDI r5, 1
LDI r4, 8
SHL r5, r4       ; r5 = 256
LDI r4, 4
SHR r5, r4       ; r5 = 16
LDI r30, 0x0205
STORE r30, r5     ; RAM[0x0205] = 16

HALT
