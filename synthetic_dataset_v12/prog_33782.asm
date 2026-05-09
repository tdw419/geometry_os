; DESCRIPTION: Places a blue line segment connecting (439, 28) to (194, 219).
; PLAN: r0=439(x1), r1=28(y1), r2=194(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 28
LDI r2, 194
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
