; DESCRIPTION: Places a black line segment connecting (253, 1) to (56, 5).
; PLAN: r0=253(x1), r1=1(y1), r2=56(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 1
LDI r2, 56
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
