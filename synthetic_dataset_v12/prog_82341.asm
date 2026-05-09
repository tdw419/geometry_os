; DESCRIPTION: Draws a blue line from (47, 80) to (396, 251).
; PLAN: r0=47(x1), r1=80(y1), r2=396(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 80
LDI r2, 396
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
