; DESCRIPTION: Places a purple line segment connecting (36, 79) to (354, 205).
; PLAN: r0=36(x1), r1=79(y1), r2=354(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 79
LDI r2, 354
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
