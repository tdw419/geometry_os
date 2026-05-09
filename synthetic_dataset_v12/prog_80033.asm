; DESCRIPTION: Places a purple line segment connecting (92, 220) to (250, 250).
; PLAN: r0=92(x1), r1=220(y1), r2=250(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 220
LDI r2, 250
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
