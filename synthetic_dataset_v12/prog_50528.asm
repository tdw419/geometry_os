; DESCRIPTION: Places a black line segment connecting (448, 195) to (184, 224).
; PLAN: r0=448(x1), r1=195(y1), r2=184(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 195
LDI r2, 184
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
