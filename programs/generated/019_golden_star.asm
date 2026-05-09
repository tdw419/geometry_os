; 019_golden_star.asm -- 5-pointed star on dark blue background
; Outer radius 100, inner radius 40, center (128,128)

; Dark blue background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x000033
RECTF r0, r1, r2, r3, r4

; Star color: gold
LDI r4, 0xFFD700

; Outer0 (128,28) -> Inner0 (152,96)
LDI r0, 128
LDI r1, 28
LDI r2, 152
LDI r3, 96
LINE r0, r1, r2, r3, r4

; Inner0 (152,96) -> Outer1 (223,97)
LDI r0, 152
LDI r1, 96
LDI r2, 223
LDI r3, 97
LINE r0, r1, r2, r3, r4

; Outer1 (223,97) -> Inner1 (166,140)
LDI r0, 223
LDI r1, 97
LDI r2, 166
LDI r3, 140
LINE r0, r1, r2, r3, r4

; Inner1 (166,140) -> Outer2 (187,209)
LDI r0, 166
LDI r1, 140
LDI r2, 187
LDI r3, 209
LINE r0, r1, r2, r3, r4

; Outer2 (187,209) -> Inner2 (128,168)
LDI r0, 187
LDI r1, 209
LDI r2, 128
LDI r3, 168
LINE r0, r1, r2, r3, r4

; Inner2 (128,168) -> Outer3 (69,209)
LDI r0, 128
LDI r1, 168
LDI r2, 69
LDI r3, 209
LINE r0, r1, r2, r3, r4

; Outer3 (69,209) -> Inner3 (90,140)
LDI r0, 69
LDI r1, 209
LDI r2, 90
LDI r3, 140
LINE r0, r1, r2, r3, r4

; Inner3 (90,140) -> Outer4 (33,97)
LDI r0, 90
LDI r1, 140
LDI r2, 33
LDI r3, 97
LINE r0, r1, r2, r3, r4

; Outer4 (33,97) -> Inner4 (104,96)
LDI r0, 33
LDI r1, 97
LDI r2, 104
LDI r3, 96
LINE r0, r1, r2, r3, r4

; Inner4 (104,96) -> Outer0 (128,28) [close the star]
LDI r0, 104
LDI r1, 96
LDI r2, 128
LDI r3, 28
LINE r0, r1, r2, r3, r4

HALT
