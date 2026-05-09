; DESCRIPTION: Renders a orange line between points (312, 62) and (212, 198).
; PLAN: r0=312(x1), r1=62(y1), r2=212(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 62
LDI r2, 212
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
