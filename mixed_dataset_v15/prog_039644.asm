; DESCRIPTION: Renders a magenta line segment connecting (138, 86) to (349, 114).
; PLAN: r0=138(x1), r1=86(y1), r2=349(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 86
LDI r2, 349
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
