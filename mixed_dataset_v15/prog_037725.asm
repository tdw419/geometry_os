; DESCRIPTION: Places a blue line segment connecting (49, 73) to (449, 222).
; PLAN: r0=49(x1), r1=73(y1), r2=449(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 73
LDI r2, 449
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
