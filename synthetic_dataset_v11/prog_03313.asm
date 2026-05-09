; DESCRIPTION: Places a magenta line segment connecting (142, 20) to (189, 199).
; PLAN: r0=142(x1), r1=20(y1), r2=189(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 20
LDI r2, 189
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
