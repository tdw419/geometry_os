; DESCRIPTION: Renders a magenta line between points (62, 184) and (99, 220).
; PLAN: r0=62(x1), r1=184(y1), r2=99(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 184
LDI r2, 99
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
