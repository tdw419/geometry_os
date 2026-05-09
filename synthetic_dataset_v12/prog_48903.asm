; DESCRIPTION: Renders a orange line between points (233, 123) and (493, 104).
; PLAN: r0=233(x1), r1=123(y1), r2=493(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 123
LDI r2, 493
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
