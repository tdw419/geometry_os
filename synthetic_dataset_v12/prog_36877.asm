; DESCRIPTION: Renders a magenta line between points (253, 138) and (319, 211).
; PLAN: r0=253(x1), r1=138(y1), r2=319(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 138
LDI r2, 319
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
