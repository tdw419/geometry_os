; DESCRIPTION: Places a magenta line segment connecting (226, 26) to (351, 73).
; PLAN: r0=226(x1), r1=26(y1), r2=351(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 26
LDI r2, 351
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
