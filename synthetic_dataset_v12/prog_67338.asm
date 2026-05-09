; DESCRIPTION: Renders a magenta line between points (78, 78) and (253, 177).
; PLAN: r0=78(x1), r1=78(y1), r2=253(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 78
LDI r2, 253
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
