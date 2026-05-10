; DESCRIPTION: Renders a magenta line segment connecting (282, 54) to (169, 57).
; PLAN: r0=282(x1), r1=54(y1), r2=169(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 54
LDI r2, 169
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
