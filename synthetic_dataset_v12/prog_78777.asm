; DESCRIPTION: Renders a orange line between points (211, 35) and (303, 102).
; PLAN: r0=211(x1), r1=35(y1), r2=303(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 35
LDI r2, 303
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
