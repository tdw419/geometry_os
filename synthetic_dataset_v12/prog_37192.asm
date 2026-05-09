; DESCRIPTION: Renders a black line between points (447, 244) and (350, 216).
; PLAN: r0=447(x1), r1=244(y1), r2=350(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 244
LDI r2, 350
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
