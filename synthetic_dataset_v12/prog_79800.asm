; DESCRIPTION: Places a blue line segment connecting (64, 248) to (270, 254).
; PLAN: r0=64(x1), r1=248(y1), r2=270(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 248
LDI r2, 270
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
