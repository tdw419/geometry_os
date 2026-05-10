; DESCRIPTION: Renders a magenta line between points (225, 101) and (396, 85).
; PLAN: r0=225(x1), r1=101(y1), r2=396(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 101
LDI r2, 396
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
