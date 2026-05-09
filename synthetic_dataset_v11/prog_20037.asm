; DESCRIPTION: Draws a blue line from (83, 76) to (211, 230).
; PLAN: r0=83(x1), r1=76(y1), r2=211(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 76
LDI r2, 211
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
