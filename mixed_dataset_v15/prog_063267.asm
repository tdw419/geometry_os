; DESCRIPTION: Draws a blue line from (80, 36) to (347, 4).
; PLAN: r0=80(x1), r1=36(y1), r2=347(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 36
LDI r2, 347
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
