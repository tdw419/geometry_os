; DESCRIPTION: Draws a blue line from (475, 76) to (331, 79).
; PLAN: r0=475(x1), r1=76(y1), r2=331(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 76
LDI r2, 331
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
