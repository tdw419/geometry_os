; DESCRIPTION: Places a magenta line segment connecting (390, 181) to (167, 16).
; PLAN: r0=390(x1), r1=181(y1), r2=167(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 181
LDI r2, 167
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
