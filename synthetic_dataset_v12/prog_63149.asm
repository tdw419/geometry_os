; DESCRIPTION: Renders a magenta line between points (269, 76) and (471, 96).
; PLAN: r0=269(x1), r1=76(y1), r2=471(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 76
LDI r2, 471
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
