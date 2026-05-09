; DESCRIPTION: Renders a orange line between points (90, 248) and (161, 136).
; PLAN: r0=90(x1), r1=248(y1), r2=161(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 248
LDI r2, 161
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
