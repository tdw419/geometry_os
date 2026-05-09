; DESCRIPTION: Renders a orange line between points (233, 43) and (305, 99).
; PLAN: r0=233(x1), r1=43(y1), r2=305(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 43
LDI r2, 305
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
