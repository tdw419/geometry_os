; DESCRIPTION: Renders a orange line between points (229, 243) and (184, 136).
; PLAN: r0=229(x1), r1=243(y1), r2=184(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 243
LDI r2, 184
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
