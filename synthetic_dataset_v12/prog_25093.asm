; DESCRIPTION: Draws a blue line from (261, 250) to (266, 72).
; PLAN: r0=261(x1), r1=250(y1), r2=266(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 250
LDI r2, 266
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
