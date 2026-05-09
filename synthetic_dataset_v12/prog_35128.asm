; DESCRIPTION: Draws a blue line from (431, 219) to (309, 133).
; PLAN: r0=431(x1), r1=219(y1), r2=309(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 219
LDI r2, 309
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
