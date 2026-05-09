; DESCRIPTION: Places a blue line segment connecting (279, 147) to (102, 163).
; PLAN: r0=279(x1), r1=147(y1), r2=102(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 147
LDI r2, 102
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
