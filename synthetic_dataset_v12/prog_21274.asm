; DESCRIPTION: Places a purple line segment connecting (509, 1) to (149, 121).
; PLAN: r0=509(x1), r1=1(y1), r2=149(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 1
LDI r2, 149
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
