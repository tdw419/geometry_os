; DESCRIPTION: Renders a blue line segment connecting (34, 128) to (291, 141).
; PLAN: r0=34(x1), r1=128(y1), r2=291(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 128
LDI r2, 291
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
