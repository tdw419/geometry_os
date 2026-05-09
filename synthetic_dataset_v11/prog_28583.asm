; DESCRIPTION: Renders a orange line between points (31, 37) and (233, 70).
; PLAN: r0=31(x1), r1=37(y1), r2=233(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 37
LDI r2, 233
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
