; DESCRIPTION: Draws a blue line from (244, 225) to (389, 62).
; PLAN: r0=244(x1), r1=225(y1), r2=389(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 225
LDI r2, 389
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
