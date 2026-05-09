; DESCRIPTION: Places a blue line segment connecting (372, 217) to (350, 92).
; PLAN: r0=372(x1), r1=217(y1), r2=350(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 217
LDI r2, 350
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
