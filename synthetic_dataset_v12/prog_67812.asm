; DESCRIPTION: Draws a blue line from (347, 224) to (287, 70).
; PLAN: r0=347(x1), r1=224(y1), r2=287(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 224
LDI r2, 287
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
