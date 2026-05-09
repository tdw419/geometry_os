; DESCRIPTION: Composite: . Then Places a green 87x110 rectangle at position (123, 132). Then Renders a purple line between points (221, 226) and (106, 114).
; PLAN: r0=123(x), r1=132(y), r2=87(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=221(x1), r1=226(y1), r2=106(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 87x110 rectangle at position (123, 132).
; PLAN: r0=123(x), r1=132(y), r2=87(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 132
LDI r2, 87
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (221, 226) and (106, 114).
; PLAN: r0=221(x1), r1=226(y1), r2=106(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 226
LDI r2, 106
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
