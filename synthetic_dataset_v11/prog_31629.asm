; DESCRIPTION: Renders a orange line between points (4, 224) and (124, 217).
; PLAN: r0=4(x1), r1=224(y1), r2=124(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 224
LDI r2, 124
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
