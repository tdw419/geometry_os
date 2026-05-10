; DESCRIPTION: Renders a magenta line segment connecting (186, 70) to (47, 158).
; PLAN: r0=186(x1), r1=70(y1), r2=47(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 70
LDI r2, 47
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
