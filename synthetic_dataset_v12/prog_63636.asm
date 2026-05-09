; DESCRIPTION: Places a blue line segment connecting (19, 121) to (167, 184).
; PLAN: r0=19(x1), r1=121(y1), r2=167(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 121
LDI r2, 167
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
