; DESCRIPTION: Places a magenta line segment connecting (248, 6) to (56, 144).
; PLAN: r0=248(x1), r1=6(y1), r2=56(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 6
LDI r2, 56
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
