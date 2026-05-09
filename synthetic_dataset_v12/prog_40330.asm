; DESCRIPTION: Renders a magenta line between points (204, 248) and (115, 130).
; PLAN: r0=204(x1), r1=248(y1), r2=115(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 248
LDI r2, 115
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
