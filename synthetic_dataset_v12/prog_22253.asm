; DESCRIPTION: Draws a blue line from (371, 223) to (232, 122).
; PLAN: r0=371(x1), r1=223(y1), r2=232(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 223
LDI r2, 232
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
