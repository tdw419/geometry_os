; DESCRIPTION: Places a blue line segment connecting (123, 43) to (164, 85).
; PLAN: r0=123(x1), r1=43(y1), r2=164(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 43
LDI r2, 164
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
