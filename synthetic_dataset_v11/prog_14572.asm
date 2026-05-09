; DESCRIPTION: Places a black line segment connecting (130, 101) to (85, 206).
; PLAN: r0=130(x1), r1=101(y1), r2=85(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 101
LDI r2, 85
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
