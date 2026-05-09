; DESCRIPTION: Places a magenta line segment connecting (148, 5) to (418, 49).
; PLAN: r0=148(x1), r1=5(y1), r2=418(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 5
LDI r2, 418
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
