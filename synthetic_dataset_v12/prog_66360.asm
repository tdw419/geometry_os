; DESCRIPTION: Renders a magenta line between points (62, 219) and (184, 35).
; PLAN: r0=62(x1), r1=219(y1), r2=184(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 219
LDI r2, 184
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
