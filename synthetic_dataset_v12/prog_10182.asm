; DESCRIPTION: Places a blue line segment connecting (26, 111) to (359, 74).
; PLAN: r0=26(x1), r1=111(y1), r2=359(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 111
LDI r2, 359
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
