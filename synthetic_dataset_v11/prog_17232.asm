; DESCRIPTION: Renders a orange line between points (60, 78) and (244, 220).
; PLAN: r0=60(x1), r1=78(y1), r2=244(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 78
LDI r2, 244
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
