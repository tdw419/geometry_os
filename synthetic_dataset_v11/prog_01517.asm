; DESCRIPTION: Places a black line segment connecting (20, 250) to (158, 43).
; PLAN: r0=20(x1), r1=250(y1), r2=158(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 250
LDI r2, 158
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
