; DESCRIPTION: Places a purple line segment connecting (125, 232) to (488, 36).
; PLAN: r0=125(x1), r1=232(y1), r2=488(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 232
LDI r2, 488
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
