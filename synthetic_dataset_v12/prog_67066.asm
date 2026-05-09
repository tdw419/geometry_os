; DESCRIPTION: Places a black line segment connecting (100, 184) to (306, 129).
; PLAN: r0=100(x1), r1=184(y1), r2=306(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 184
LDI r2, 306
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
