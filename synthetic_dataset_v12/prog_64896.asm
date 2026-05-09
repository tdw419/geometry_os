; DESCRIPTION: Renders a blue line between points (509, 110) and (476, 31).
; PLAN: r0=509(x1), r1=110(y1), r2=476(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 110
LDI r2, 476
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
