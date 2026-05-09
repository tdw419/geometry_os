; DESCRIPTION: Renders a magenta line between points (118, 102) and (204, 31).
; PLAN: r0=118(x1), r1=102(y1), r2=204(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 102
LDI r2, 204
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
