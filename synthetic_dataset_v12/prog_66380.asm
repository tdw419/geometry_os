; DESCRIPTION: Places a magenta line segment connecting (142, 66) to (454, 148).
; PLAN: r0=142(x1), r1=66(y1), r2=454(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 66
LDI r2, 454
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
