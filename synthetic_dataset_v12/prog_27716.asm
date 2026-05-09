; DESCRIPTION: Places a blue line segment connecting (449, 173) to (201, 141).
; PLAN: r0=449(x1), r1=173(y1), r2=201(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 173
LDI r2, 201
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
