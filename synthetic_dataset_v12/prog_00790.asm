; DESCRIPTION: Places a blue line segment connecting (96, 135) to (430, 254).
; PLAN: r0=96(x1), r1=135(y1), r2=430(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 135
LDI r2, 430
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
