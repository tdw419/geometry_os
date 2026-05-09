; DESCRIPTION: Renders a orange line between points (494, 35) and (490, 77).
; PLAN: r0=494(x1), r1=35(y1), r2=490(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 35
LDI r2, 490
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
