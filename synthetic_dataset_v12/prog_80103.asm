; DESCRIPTION: Places a blue line segment connecting (18, 127) to (359, 5).
; PLAN: r0=18(x1), r1=127(y1), r2=359(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 127
LDI r2, 359
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
