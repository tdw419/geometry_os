; DESCRIPTION: Renders a magenta line between points (390, 26) and (505, 163).
; PLAN: r0=390(x1), r1=26(y1), r2=505(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 26
LDI r2, 505
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
