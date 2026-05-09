; DESCRIPTION: Renders a orange line between points (153, 78) and (293, 13).
; PLAN: r0=153(x1), r1=78(y1), r2=293(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 78
LDI r2, 293
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
