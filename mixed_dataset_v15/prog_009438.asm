; DESCRIPTION: Places a blue line segment connecting (22, 127) to (149, 19).
; PLAN: r0=22(x1), r1=127(y1), r2=149(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 127
LDI r2, 149
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
