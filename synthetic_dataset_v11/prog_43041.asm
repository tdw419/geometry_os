; DESCRIPTION: Draws a black line from (163, 224) to (30, 105).
; PLAN: r0=163(x1), r1=224(y1), r2=30(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 224
LDI r2, 30
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
