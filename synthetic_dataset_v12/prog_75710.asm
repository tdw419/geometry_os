; DESCRIPTION: Places a blue line segment connecting (200, 47) to (291, 167).
; PLAN: r0=200(x1), r1=47(y1), r2=291(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 47
LDI r2, 291
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
