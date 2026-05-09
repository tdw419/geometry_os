; DESCRIPTION: Places a magenta line segment connecting (12, 226) to (137, 13).
; PLAN: r0=12(x1), r1=226(y1), r2=137(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 226
LDI r2, 137
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
