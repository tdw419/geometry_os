; DESCRIPTION: Places a black line segment connecting (198, 24) to (136, 249).
; PLAN: r0=198(x1), r1=24(y1), r2=136(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 24
LDI r2, 136
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
