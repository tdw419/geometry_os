; DESCRIPTION: Places a purple line segment connecting (360, 178) to (236, 23).
; PLAN: r0=360(x1), r1=178(y1), r2=236(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 178
LDI r2, 236
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
