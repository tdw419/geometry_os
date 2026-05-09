; DESCRIPTION: Places a black line segment connecting (158, 157) to (9, 240).
; PLAN: r0=158(x1), r1=157(y1), r2=9(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 157
LDI r2, 9
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
