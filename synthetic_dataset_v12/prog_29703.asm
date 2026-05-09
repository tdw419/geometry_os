; DESCRIPTION: Places a magenta line segment connecting (100, 246) to (136, 65).
; PLAN: r0=100(x1), r1=246(y1), r2=136(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 246
LDI r2, 136
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
