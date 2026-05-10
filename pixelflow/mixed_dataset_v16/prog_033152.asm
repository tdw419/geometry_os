; DESCRIPTION: Renders a orange line between points (153, 124) and (14, 99).
; PLAN: r0=153(x1), r1=124(y1), r2=14(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 124
LDI r2, 14
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
