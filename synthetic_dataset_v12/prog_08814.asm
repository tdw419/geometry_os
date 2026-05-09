; DESCRIPTION: Places a magenta line segment connecting (147, 106) to (43, 134).
; PLAN: r0=147(x1), r1=106(y1), r2=43(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 106
LDI r2, 43
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
