; DESCRIPTION: Renders a blue line between points (476, 14) and (28, 144).
; PLAN: r0=476(x1), r1=14(y1), r2=28(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 14
LDI r2, 28
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
