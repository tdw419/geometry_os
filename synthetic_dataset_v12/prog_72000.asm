; DESCRIPTION: Places a magenta line segment connecting (316, 167) to (160, 184).
; PLAN: r0=316(x1), r1=167(y1), r2=160(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 167
LDI r2, 160
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
