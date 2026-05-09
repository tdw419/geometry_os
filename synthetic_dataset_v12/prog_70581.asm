; DESCRIPTION: Renders a orange line between points (394, 52) and (472, 148).
; PLAN: r0=394(x1), r1=52(y1), r2=472(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 52
LDI r2, 472
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
