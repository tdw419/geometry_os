; DESCRIPTION: Renders a orange line between points (34, 38) and (127, 155).
; PLAN: r0=34(x1), r1=38(y1), r2=127(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 38
LDI r2, 127
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
