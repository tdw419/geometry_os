; DESCRIPTION: Places a purple line segment connecting (483, 3) to (194, 42).
; PLAN: r0=483(x1), r1=3(y1), r2=194(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 3
LDI r2, 194
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
