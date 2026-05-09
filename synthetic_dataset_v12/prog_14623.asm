; DESCRIPTION: Renders a magenta line between points (194, 147) and (195, 43).
; PLAN: r0=194(x1), r1=147(y1), r2=195(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 147
LDI r2, 195
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
