; DESCRIPTION: Renders a magenta line between points (194, 88) and (71, 243).
; PLAN: r0=194(x1), r1=88(y1), r2=71(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 88
LDI r2, 71
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
