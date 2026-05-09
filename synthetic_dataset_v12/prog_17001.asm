; DESCRIPTION: Draws a blue line from (111, 35) to (155, 48).
; PLAN: r0=111(x1), r1=35(y1), r2=155(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 35
LDI r2, 155
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
