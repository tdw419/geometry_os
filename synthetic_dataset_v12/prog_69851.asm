; DESCRIPTION: Renders a orange line between points (359, 39) and (35, 76).
; PLAN: r0=359(x1), r1=39(y1), r2=35(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 39
LDI r2, 35
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
