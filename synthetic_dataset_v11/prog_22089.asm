; DESCRIPTION: Renders a orange line between points (38, 19) and (8, 62).
; PLAN: r0=38(x1), r1=19(y1), r2=8(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 19
LDI r2, 8
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
