; DESCRIPTION: Renders a magenta line between points (137, 12) and (396, 65).
; PLAN: r0=137(x1), r1=12(y1), r2=396(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 12
LDI r2, 396
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
