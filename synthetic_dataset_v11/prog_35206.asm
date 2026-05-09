; DESCRIPTION: Places a blue line segment connecting (251, 246) to (80, 155).
; PLAN: r0=251(x1), r1=246(y1), r2=80(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 246
LDI r2, 80
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
