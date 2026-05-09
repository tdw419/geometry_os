; DESCRIPTION: Places a blue line segment connecting (134, 81) to (2, 214).
; PLAN: r0=134(x1), r1=81(y1), r2=2(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 81
LDI r2, 2
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
