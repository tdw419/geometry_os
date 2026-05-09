; DESCRIPTION: Renders a magenta line between points (112, 31) and (29, 148).
; PLAN: r0=112(x1), r1=31(y1), r2=29(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 31
LDI r2, 29
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
