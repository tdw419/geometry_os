; DESCRIPTION: Places a black line segment connecting (15, 148) to (100, 81).
; PLAN: r0=15(x1), r1=148(y1), r2=100(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 148
LDI r2, 100
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
