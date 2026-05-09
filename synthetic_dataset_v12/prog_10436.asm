; DESCRIPTION: Renders a orange line between points (314, 196) and (442, 49).
; PLAN: r0=314(x1), r1=196(y1), r2=442(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 196
LDI r2, 442
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
