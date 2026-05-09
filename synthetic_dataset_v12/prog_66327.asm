; DESCRIPTION: Draws a purple line from (376, 250) to (396, 25).
; PLAN: r0=376(x1), r1=250(y1), r2=396(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 250
LDI r2, 396
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
