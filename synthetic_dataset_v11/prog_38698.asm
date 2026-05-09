; DESCRIPTION: Places a magenta line segment connecting (49, 189) to (142, 94).
; PLAN: r0=49(x1), r1=189(y1), r2=142(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 189
LDI r2, 142
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
