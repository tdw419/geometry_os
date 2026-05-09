; DESCRIPTION: Places a black line segment connecting (253, 199) to (170, 227).
; PLAN: r0=253(x1), r1=199(y1), r2=170(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 199
LDI r2, 170
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
