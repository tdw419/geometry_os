; DESCRIPTION: Renders a orange line between points (65, 234) and (136, 69).
; PLAN: r0=65(x1), r1=234(y1), r2=136(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 234
LDI r2, 136
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
