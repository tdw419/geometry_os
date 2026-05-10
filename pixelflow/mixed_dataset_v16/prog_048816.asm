; DESCRIPTION: Places a blue line segment connecting (488, 191) to (269, 232).
; PLAN: r0=488(x1), r1=191(y1), r2=269(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 191
LDI r2, 269
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
