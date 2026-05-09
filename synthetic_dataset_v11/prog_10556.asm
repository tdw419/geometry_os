; DESCRIPTION: Draws a blue line from (86, 244) to (95, 140).
; PLAN: r0=86(x1), r1=244(y1), r2=95(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 244
LDI r2, 95
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
