; DESCRIPTION: Places a magenta line segment connecting (97, 81) to (237, 109).
; PLAN: r0=97(x1), r1=81(y1), r2=237(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 81
LDI r2, 237
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
