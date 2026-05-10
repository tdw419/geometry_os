; DESCRIPTION: Renders a magenta line between points (14, 226) and (483, 130).
; PLAN: r0=14(x1), r1=226(y1), r2=483(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 226
LDI r2, 483
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
