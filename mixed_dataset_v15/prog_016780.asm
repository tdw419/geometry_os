; DESCRIPTION: Renders a magenta line between points (471, 165) and (212, 245).
; PLAN: r0=471(x1), r1=165(y1), r2=212(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 165
LDI r2, 212
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
