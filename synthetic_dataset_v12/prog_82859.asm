; DESCRIPTION: Places a blue line segment connecting (40, 137) to (336, 115).
; PLAN: r0=40(x1), r1=137(y1), r2=336(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 137
LDI r2, 336
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
