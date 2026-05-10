; DESCRIPTION: Renders a magenta line segment connecting (183, 140) to (19, 48).
; PLAN: r0=183(x1), r1=140(y1), r2=19(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 140
LDI r2, 19
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
