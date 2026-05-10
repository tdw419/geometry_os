; DESCRIPTION: Renders a magenta line segment connecting (34, 195) to (134, 2).
; PLAN: r0=34(x1), r1=195(y1), r2=134(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 195
LDI r2, 134
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
