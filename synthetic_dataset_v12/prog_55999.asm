; DESCRIPTION: Places a blue line segment connecting (273, 17) to (72, 157).
; PLAN: r0=273(x1), r1=17(y1), r2=72(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 17
LDI r2, 72
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
