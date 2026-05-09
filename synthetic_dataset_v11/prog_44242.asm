; DESCRIPTION: Renders a orange line between points (219, 49) and (124, 3).
; PLAN: r0=219(x1), r1=49(y1), r2=124(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 49
LDI r2, 124
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
