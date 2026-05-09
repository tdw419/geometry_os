; DESCRIPTION: Draws a purple line from (219, 45) to (80, 1).
; PLAN: r0=219(x1), r1=45(y1), r2=80(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 45
LDI r2, 80
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
