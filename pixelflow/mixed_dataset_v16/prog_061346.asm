; DESCRIPTION: Renders a magenta line between points (77, 155) and (431, 130).
; PLAN: r0=77(x1), r1=155(y1), r2=431(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 155
LDI r2, 431
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
