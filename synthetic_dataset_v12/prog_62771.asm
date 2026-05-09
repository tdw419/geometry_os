; DESCRIPTION: Renders a magenta line between points (396, 129) and (390, 184).
; PLAN: r0=396(x1), r1=129(y1), r2=390(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 129
LDI r2, 390
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
