; DESCRIPTION: Renders a magenta line segment connecting (139, 185) to (138, 52).
; PLAN: r0=139(x1), r1=185(y1), r2=138(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 185
LDI r2, 138
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
