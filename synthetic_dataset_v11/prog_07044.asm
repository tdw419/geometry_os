; DESCRIPTION: Places a blue line segment connecting (252, 160) to (165, 194).
; PLAN: r0=252(x1), r1=160(y1), r2=165(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 160
LDI r2, 165
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
