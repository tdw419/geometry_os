; DESCRIPTION: Places a blue line segment connecting (481, 136) to (230, 253).
; PLAN: r0=481(x1), r1=136(y1), r2=230(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 136
LDI r2, 230
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
