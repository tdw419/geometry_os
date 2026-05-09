; DESCRIPTION: Places a black line segment connecting (15, 31) to (5, 2).
; PLAN: r0=15(x1), r1=31(y1), r2=5(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 31
LDI r2, 5
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
