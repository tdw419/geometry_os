; DESCRIPTION: Places a black line segment connecting (158, 7) to (157, 19).
; PLAN: r0=158(x1), r1=7(y1), r2=157(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 7
LDI r2, 157
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
