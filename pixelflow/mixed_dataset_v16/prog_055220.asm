; DESCRIPTION: Draws a blue line from (184, 46) to (244, 121).
; PLAN: r0=184(x1), r1=46(y1), r2=244(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 46
LDI r2, 244
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
