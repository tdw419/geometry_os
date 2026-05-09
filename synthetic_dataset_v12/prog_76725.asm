; DESCRIPTION: Renders a orange line between points (137, 78) and (416, 50).
; PLAN: r0=137(x1), r1=78(y1), r2=416(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 78
LDI r2, 416
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
