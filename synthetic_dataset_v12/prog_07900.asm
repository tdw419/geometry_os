; DESCRIPTION: Places a black line segment connecting (374, 105) to (292, 179).
; PLAN: r0=374(x1), r1=105(y1), r2=292(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 105
LDI r2, 292
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
