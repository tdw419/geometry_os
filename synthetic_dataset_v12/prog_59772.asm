; DESCRIPTION: Places a magenta line segment connecting (167, 136) to (323, 136).
; PLAN: r0=167(x1), r1=136(y1), r2=323(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 136
LDI r2, 323
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
