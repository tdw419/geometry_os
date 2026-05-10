; DESCRIPTION: Draws a blue line from (474, 218) to (149, 84).
; PLAN: r0=474(x1), r1=218(y1), r2=149(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 218
LDI r2, 149
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
