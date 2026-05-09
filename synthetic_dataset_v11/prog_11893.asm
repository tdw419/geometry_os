; DESCRIPTION: Places a blue line segment connecting (167, 100) to (157, 81).
; PLAN: r0=167(x1), r1=100(y1), r2=157(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 100
LDI r2, 157
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
