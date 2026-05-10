; DESCRIPTION: Draws a purple line from (108, 110) to (310, 199).
; PLAN: r0=108(x1), r1=110(y1), r2=310(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 110
LDI r2, 310
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
