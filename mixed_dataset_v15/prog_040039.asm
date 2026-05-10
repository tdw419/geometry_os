; DESCRIPTION: Renders a magenta line segment connecting (74, 101) to (323, 26).
; PLAN: r0=74(x1), r1=101(y1), r2=323(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 101
LDI r2, 323
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
