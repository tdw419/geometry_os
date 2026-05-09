; DESCRIPTION: Draws a blue line from (347, 254) to (366, 250).
; PLAN: r0=347(x1), r1=254(y1), r2=366(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 254
LDI r2, 366
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
