; DESCRIPTION: Places a magenta line segment connecting (96, 248) to (52, 149).
; PLAN: r0=96(x1), r1=248(y1), r2=52(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 248
LDI r2, 52
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
