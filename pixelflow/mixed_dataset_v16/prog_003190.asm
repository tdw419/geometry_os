; DESCRIPTION: Places a blue line segment connecting (230, 226) to (29, 88).
; PLAN: r0=230(x1), r1=226(y1), r2=29(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 226
LDI r2, 29
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
