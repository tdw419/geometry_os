; DESCRIPTION: Renders a orange line between points (65, 34) and (36, 55).
; PLAN: r0=65(x1), r1=34(y1), r2=36(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 34
LDI r2, 36
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
