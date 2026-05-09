; DESCRIPTION: Draws a blue line from (339, 232) to (511, 4).
; PLAN: r0=339(x1), r1=232(y1), r2=511(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 232
LDI r2, 511
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
