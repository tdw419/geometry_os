; DESCRIPTION: Places a purple line segment connecting (194, 242) to (348, 29).
; PLAN: r0=194(x1), r1=242(y1), r2=348(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 242
LDI r2, 348
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
