; DESCRIPTION: Renders a magenta line between points (88, 177) and (96, 183).
; PLAN: r0=88(x1), r1=177(y1), r2=96(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 177
LDI r2, 96
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
