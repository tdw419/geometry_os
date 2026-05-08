; DESCRIPTION: Render a colored object at the screen.

; shift_test.asm -- Test SHL and SHR opcodes
;
; Tests:
;   1 << 4 = 16  (SHL basic)
;   16 >> 2 = 4  (SHR basic)
;   5 << 0 = 5   (SHL by zero)
;   1 << 36 = 1 << 4 = 16  (shift amount mod 32)
;   0xFFFF >> 1 = 0x7FFF  (logical shift right, no sign extension)

; Test 1 -- SHL basic -- r4 = 1 << 4 = 16
LDI r4, 1
LDI r3, 4
SHL r4, r3
LDI r30, 0x0200
STORE r30, r4     ; RAM[0x0200] = 16

; Test 2 -- SHR basic -- r4 = 16 >> 2 = 4
LDI r4, 16
LDI r3, 2
SHR r4, r3
LDI r30, 0x0201
STORE r30, r4     ; RAM[0x0201] = 4

; Test 3 -- SHL by zero -- r4 = 5 << 0 = 5
LDI r4, 5
LDI r3, 0
SHL r4, r3
LDI r30, 0x0202
STORE r30, r4     ; RAM[0x0202] = 5

; Test 4 -- SHL with large shift (mod 32) -- r4 = 1 << (36 % 32) = 1 << 4 = 16
LDI r4, 1
LDI r3, 36
SHL r4, r3
LDI r30, 0x0203
STORE r30, r4     ; RAM[0x0203] = 16

; Test 5 -- SHR logical -- r4 = 0xFFFF >> 1 = 0x7FFF (no sign extension)
LDI r4, 0xFFFF
LDI r3, 1
SHR r4, r3
LDI r30, 0x0204
STORE r30, r4     ; RAM[0x0204] = 0x7FFF

; Test 6 -- SHL to reconstruct -- (1 << 8) >> 4 = 16
LDI r4, 1
LDI r3, 8
SHL r4, r3       ; r4 = 256
LDI r3, 4
SHR r4, r3       ; r4 = 16
LDI r30, 0x0205
STORE r30, r4     ; RAM[0x0205] = 16

HALT
