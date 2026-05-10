; DESCRIPTION: Places a blue line segment connecting (179, 113) to (196, 58).
; PLAN: r0=179(x1), r1=113(y1), r2=196(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 113
LDI r2, 196
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
