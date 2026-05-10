; DESCRIPTION: Places a magenta line segment connecting (97, 172) to (24, 23).
; PLAN: r0=97(x1), r1=172(y1), r2=24(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 172
LDI r2, 24
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
