; DESCRIPTION: Draws a blue line from (347, 102) to (278, 60).
; PLAN: r0=347(x1), r1=102(y1), r2=278(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 102
LDI r2, 278
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
