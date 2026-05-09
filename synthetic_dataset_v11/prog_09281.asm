; DESCRIPTION: Places a yellow line segment connecting (100, 237) to (169, 246).
; PLAN: r0=100(x1), r1=237(y1), r2=169(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 237
LDI r2, 169
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
