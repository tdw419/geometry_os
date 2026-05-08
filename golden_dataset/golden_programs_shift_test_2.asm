; DESCRIPTION: Geometry OS program to draw a colored object.

; shift_test.asm -- Test SHL and SHR opcodes
;
; Tests:
;   1 << 4 = 16  (SHL basic)
;   16 >> 2 = 4  (SHR basic)
;   5 << 0 = 5   (SHL by zero)
;   1 << 36 = 1 << 4 = 16  (shift amount mod 32)
;   0xFFFF >> 1 = 0x7FFF  (logical shift right, no sign extension)

; Test 1 -- SHL basic -- r12 = 1 << 4 = 16
LDI r12, 1
LDI r7, 4
SHL r12, r7
LDI r30, 0x0200
STORE r30, r12     ; RAM[0x0200] = 16

; Test 2 -- SHR basic -- r12 = 16 >> 2 = 4
LDI r12, 16
LDI r7, 2
SHR r12, r7
LDI r30, 0x0201
STORE r30, r12     ; RAM[0x0201] = 4

; Test 3 -- SHL by zero -- r12 = 5 << 0 = 5
LDI r12, 5
LDI r7, 0
SHL r12, r7
LDI r30, 0x0202
STORE r30, r12     ; RAM[0x0202] = 5

; Test 4 -- SHL with large shift (mod 32) -- r12 = 1 << (36 % 32) = 1 << 4 = 16
LDI r12, 1
LDI r7, 36
SHL r12, r7
LDI r30, 0x0203
STORE r30, r12     ; RAM[0x0203] = 16

; Test 5 -- SHR logical -- r12 = 0xFFFF >> 1 = 0x7FFF (no sign extension)
LDI r12, 0xFFFF
LDI r7, 1
SHR r12, r7
LDI r30, 0x0204
STORE r30, r12     ; RAM[0x0204] = 0x7FFF

; Test 6 -- SHL to reconstruct -- (1 << 8) >> 4 = 16
LDI r12, 1
LDI r7, 8
SHL r12, r7       ; r12 = 256
LDI r7, 4
SHR r12, r7       ; r12 = 16
LDI r30, 0x0205
STORE r30, r12     ; RAM[0x0205] = 16

HALT
