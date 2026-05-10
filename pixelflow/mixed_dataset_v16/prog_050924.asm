; DESCRIPTION: Draws a purple line from (19, 219) to (219, 105).
; PLAN: r0=19(x1), r1=219(y1), r2=219(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 219
LDI r2, 219
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
