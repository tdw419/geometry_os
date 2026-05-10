; DESCRIPTION: Places a blue line segment connecting (117, 43) to (23, 133).
; PLAN: r0=117(x1), r1=43(y1), r2=23(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 43
LDI r2, 23
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
