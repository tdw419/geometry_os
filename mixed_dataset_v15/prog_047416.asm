; DESCRIPTION: Places a blue line segment connecting (444, 76) to (474, 179).
; PLAN: r0=444(x1), r1=76(y1), r2=474(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 76
LDI r2, 474
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
