; DESCRIPTION: Places a blue line segment connecting (181, 1) to (230, 128).
; PLAN: r0=181(x1), r1=1(y1), r2=230(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 1
LDI r2, 230
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
