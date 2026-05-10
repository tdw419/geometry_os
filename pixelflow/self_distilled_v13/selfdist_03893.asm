; DESCRIPTION: Renders a magenta line segment connecting (286, 169) to (80, 114).
; PLAN: r0=286(x1), r1=169(y1), r2=80(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 169
LDI r2, 80
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
