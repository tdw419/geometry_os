; DESCRIPTION: Places a blue line segment connecting (449, 136) to (305, 72).
; PLAN: r0=449(x1), r1=136(y1), r2=305(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 136
LDI r2, 305
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
