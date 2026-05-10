; DESCRIPTION: Draws a purple line from (442, 17) to (349, 109).
; PLAN: r0=442(x1), r1=17(y1), r2=349(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 17
LDI r2, 349
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
