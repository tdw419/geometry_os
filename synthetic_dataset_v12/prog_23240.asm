; DESCRIPTION: Places a blue line segment connecting (338, 144) to (201, 95).
; PLAN: r0=338(x1), r1=144(y1), r2=201(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 144
LDI r2, 201
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
