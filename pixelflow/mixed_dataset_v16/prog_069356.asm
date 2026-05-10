; DESCRIPTION: Renders a orange line between points (373, 29) and (452, 110).
; PLAN: r0=373(x1), r1=29(y1), r2=452(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 29
LDI r2, 452
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
