; DESCRIPTION: Places a blue line segment connecting (439, 49) to (138, 80).
; PLAN: r0=439(x1), r1=49(y1), r2=138(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 49
LDI r2, 138
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
