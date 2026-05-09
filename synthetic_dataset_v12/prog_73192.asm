; DESCRIPTION: Places a blue line segment connecting (399, 167) to (90, 121).
; PLAN: r0=399(x1), r1=167(y1), r2=90(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 167
LDI r2, 90
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
