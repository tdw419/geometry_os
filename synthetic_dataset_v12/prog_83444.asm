; DESCRIPTION: Renders a orange line between points (70, 247) and (459, 62).
; PLAN: r0=70(x1), r1=247(y1), r2=459(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 247
LDI r2, 459
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
