; DESCRIPTION: Renders a orange line between points (65, 243) and (62, 5).
; PLAN: r0=65(x1), r1=243(y1), r2=62(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 243
LDI r2, 62
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
