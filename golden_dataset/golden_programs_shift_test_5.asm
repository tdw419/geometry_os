; DESCRIPTION: Display a object using color colored at the screen.

; shift_test.asm -- Test SHL and SHR opcodes
;
; Tests:
;   1 << 4 = 16  (SHL basic)
;   16 >> 2 = 4  (SHR basic)
;   5 << 0 = 5   (SHL by zero)
;   1 << 36 = 1 << 4 = 16  (shift amount mod 32)
;   0xFFFF >> 1 = 0x7FFF  (logical shift right, no sign extension)

; Test 1 -- SHL basic -- r7 = 1 << 4 = 16
LDI r7, 1
LDI r1, 4
SHL r7, r1
LDI r30, 0x0200
STORE r30, r7     ; RAM[0x0200] = 16

; Test 2 -- SHR basic -- r7 = 16 >> 2 = 4
LDI r7, 16
LDI r1, 2
SHR r7, r1
LDI r30, 0x0201
STORE r30, r7     ; RAM[0x0201] = 4

; Test 3 -- SHL by zero -- r7 = 5 << 0 = 5
LDI r7, 5
LDI r1, 0
SHL r7, r1
LDI r30, 0x0202
STORE r30, r7     ; RAM[0x0202] = 5

; Test 4 -- SHL with large shift (mod 32) -- r7 = 1 << (36 % 32) = 1 << 4 = 16
LDI r7, 1
LDI r1, 36
SHL r7, r1
LDI r30, 0x0203
STORE r30, r7     ; RAM[0x0203] = 16

; Test 5 -- SHR logical -- r7 = 0xFFFF >> 1 = 0x7FFF (no sign extension)
LDI r7, 0xFFFF
LDI r1, 1
SHR r7, r1
LDI r30, 0x0204
STORE r30, r7     ; RAM[0x0204] = 0x7FFF

; Test 6 -- SHL to reconstruct -- (1 << 8) >> 4 = 16
LDI r7, 1
LDI r1, 8
SHL r7, r1       ; r7 = 256
LDI r1, 4
SHR r7, r1       ; r7 = 16
LDI r30, 0x0205
STORE r30, r7     ; RAM[0x0205] = 16

HALT
