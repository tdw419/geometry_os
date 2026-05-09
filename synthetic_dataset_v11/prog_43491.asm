; DESCRIPTION: Draws a blue line from (244, 142) to (108, 60).
; PLAN: r0=244(x1), r1=142(y1), r2=108(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 142
LDI r2, 108
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
