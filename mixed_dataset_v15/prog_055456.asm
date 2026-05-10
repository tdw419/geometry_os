; DESCRIPTION: Places a black line segment connecting (9, 100) to (245, 172).
; PLAN: r0=9(x1), r1=100(y1), r2=245(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 100
LDI r2, 245
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
