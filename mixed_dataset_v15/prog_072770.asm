; DESCRIPTION: Renders a orange line between points (285, 116) and (20, 11).
; PLAN: r0=285(x1), r1=116(y1), r2=20(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 116
LDI r2, 20
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
