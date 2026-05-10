; DESCRIPTION: Renders a magenta line segment connecting (121, 13) to (399, 185).
; PLAN: r0=121(x1), r1=13(y1), r2=399(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 13
LDI r2, 399
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
