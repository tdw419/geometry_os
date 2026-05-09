; DESCRIPTION: Places a purple line segment connecting (240, 210) to (488, 11).
; PLAN: r0=240(x1), r1=210(y1), r2=488(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 210
LDI r2, 488
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
