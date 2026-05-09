; DESCRIPTION: Renders a magenta line between points (226, 76) and (129, 247).
; PLAN: r0=226(x1), r1=76(y1), r2=129(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 76
LDI r2, 129
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
