; DESCRIPTION: Places a magenta line segment connecting (342, 9) to (353, 144).
; PLAN: r0=342(x1), r1=9(y1), r2=353(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 9
LDI r2, 353
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
