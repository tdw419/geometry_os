; DESCRIPTION: Places a blue line segment connecting (155, 35) to (462, 215).
; PLAN: r0=155(x1), r1=35(y1), r2=462(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 35
LDI r2, 462
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
