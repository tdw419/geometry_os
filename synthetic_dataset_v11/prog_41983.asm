; DESCRIPTION: Renders a orange line between points (62, 35) and (164, 74).
; PLAN: r0=62(x1), r1=35(y1), r2=164(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 35
LDI r2, 164
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
