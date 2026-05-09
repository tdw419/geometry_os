; DESCRIPTION: Places a orange line segment connecting (249, 2) to (253, 170).
; PLAN: r0=249(x1), r1=2(y1), r2=253(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 2
LDI r2, 253
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
