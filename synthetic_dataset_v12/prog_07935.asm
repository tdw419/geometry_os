; DESCRIPTION: Places a blue line segment connecting (440, 92) to (378, 222).
; PLAN: r0=440(x1), r1=92(y1), r2=378(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 92
LDI r2, 378
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
