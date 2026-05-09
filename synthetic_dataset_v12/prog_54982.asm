; DESCRIPTION: Places a magenta line segment connecting (86, 137) to (72, 149).
; PLAN: r0=86(x1), r1=137(y1), r2=72(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 137
LDI r2, 72
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
