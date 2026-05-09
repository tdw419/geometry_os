; DESCRIPTION: Places a purple line segment connecting (48, 100) to (92, 114).
; PLAN: r0=48(x1), r1=100(y1), r2=92(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 100
LDI r2, 92
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
