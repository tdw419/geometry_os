; DESCRIPTION: Places a purple line segment connecting (98, 92) to (488, 157).
; PLAN: r0=98(x1), r1=92(y1), r2=488(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 92
LDI r2, 488
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
