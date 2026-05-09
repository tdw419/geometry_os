; DESCRIPTION: Places a blue line segment connecting (505, 81) to (476, 226).
; PLAN: r0=505(x1), r1=81(y1), r2=476(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 81
LDI r2, 476
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
