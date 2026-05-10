; DESCRIPTION: Renders a magenta line segment connecting (191, 81) to (301, 49).
; PLAN: r0=191(x1), r1=81(y1), r2=301(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 81
LDI r2, 301
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
