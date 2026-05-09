; DESCRIPTION: Renders a orange line between points (54, 88) and (433, 198).
; PLAN: r0=54(x1), r1=88(y1), r2=433(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 88
LDI r2, 433
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
