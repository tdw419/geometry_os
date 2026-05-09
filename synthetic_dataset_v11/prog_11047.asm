; DESCRIPTION: Places a blue line segment connecting (196, 113) to (170, 23).
; PLAN: r0=196(x1), r1=113(y1), r2=170(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 113
LDI r2, 170
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
