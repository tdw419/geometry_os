; DESCRIPTION: Draws a yellow line from (442, 56) to (477, 211).
; PLAN: r0=442(x1), r1=56(y1), r2=477(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 56
LDI r2, 477
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
