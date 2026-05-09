; DESCRIPTION: Places a blue line segment connecting (481, 167) to (459, 94).
; PLAN: r0=481(x1), r1=167(y1), r2=459(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 167
LDI r2, 459
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
