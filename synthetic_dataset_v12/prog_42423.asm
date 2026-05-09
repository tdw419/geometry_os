; DESCRIPTION: Places a purple line segment connecting (95, 78) to (469, 184).
; PLAN: r0=95(x1), r1=78(y1), r2=469(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 78
LDI r2, 469
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
