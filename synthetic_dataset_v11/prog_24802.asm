; DESCRIPTION: Draws a purple line from (19, 120) to (200, 219).
; PLAN: r0=19(x1), r1=120(y1), r2=200(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 120
LDI r2, 200
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
