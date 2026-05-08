; DESCRIPTION: Render a colored object at the screen.

; shift_test.asm -- Test SHL and SHR opcodes
;
; Tests:
;   1 << 4 = 16  (SHL basic)
;   16 >> 2 = 4  (SHR basic)
;   5 << 0 = 5   (SHL by zero)
;   1 << 36 = 1 << 4 = 16  (shift amount mod 32)
;   0xFFFF >> 1 = 0x7FFF  (logical shift right, no sign extension)

; Test 1 -- SHL basic -- r15 = 1 << 4 = 16
LDI r15, 1
LDI r2, 4
SHL r15, r2
LDI r30, 0x0200
STORE r30, r15     ; RAM[0x0200] = 16

; Test 2 -- SHR basic -- r15 = 16 >> 2 = 4
LDI r15, 16
LDI r2, 2
SHR r15, r2
LDI r30, 0x0201
STORE r30, r15     ; RAM[0x0201] = 4

; Test 3 -- SHL by zero -- r15 = 5 << 0 = 5
LDI r15, 5
LDI r2, 0
SHL r15, r2
LDI r30, 0x0202
STORE r30, r15     ; RAM[0x0202] = 5

; Test 4 -- SHL with large shift (mod 32) -- r15 = 1 << (36 % 32) = 1 << 4 = 16
LDI r15, 1
LDI r2, 36
SHL r15, r2
LDI r30, 0x0203
STORE r30, r15     ; RAM[0x0203] = 16

; Test 5 -- SHR logical -- r15 = 0xFFFF >> 1 = 0x7FFF (no sign extension)
LDI r15, 0xFFFF
LDI r2, 1
SHR r15, r2
LDI r30, 0x0204
STORE r30, r15     ; RAM[0x0204] = 0x7FFF

; Test 6 -- SHL to reconstruct -- (1 << 8) >> 4 = 16
LDI r15, 1
LDI r2, 8
SHL r15, r2       ; r15 = 256
LDI r2, 4
SHR r15, r2       ; r15 = 16
LDI r30, 0x0205
STORE r30, r15     ; RAM[0x0205] = 16

HALT
