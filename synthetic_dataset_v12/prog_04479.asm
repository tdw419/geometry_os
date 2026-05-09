; DESCRIPTION: Places a blue line segment connecting (170, 25) to (309, 116).
; PLAN: r0=170(x1), r1=25(y1), r2=309(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 25
LDI r2, 309
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
