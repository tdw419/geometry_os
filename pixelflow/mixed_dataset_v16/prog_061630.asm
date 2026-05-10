; DESCRIPTION: Renders a orange line between points (138, 139) and (176, 2).
; PLAN: r0=138(x1), r1=139(y1), r2=176(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 139
LDI r2, 176
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
