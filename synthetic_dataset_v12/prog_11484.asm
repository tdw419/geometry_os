; DESCRIPTION: Draws a blue line from (244, 15) to (35, 108).
; PLAN: r0=244(x1), r1=15(y1), r2=35(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 15
LDI r2, 35
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
