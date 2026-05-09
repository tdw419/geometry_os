; DESCRIPTION: Draws a blue line from (431, 98) to (359, 185).
; PLAN: r0=431(x1), r1=98(y1), r2=359(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 98
LDI r2, 359
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
