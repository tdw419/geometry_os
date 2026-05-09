; DESCRIPTION: Composite: . Then Places a blue 115x10 rectangle at position (132, 101). Then Renders a orange line between points (236, 124) and (26, 112).
; PLAN: r0=132(x), r1=101(y), r2=115(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=236(x1), r1=124(y1), r2=26(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 115x10 rectangle at position (132, 101).
; PLAN: r0=132(x), r1=101(y), r2=115(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 101
LDI r2, 115
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (236, 124) and (26, 112).
; PLAN: r0=236(x1), r1=124(y1), r2=26(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 124
LDI r2, 26
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
