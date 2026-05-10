; DESCRIPTION: Places a blue line segment connecting (3, 32) to (219, 95).
; PLAN: r0=3(x1), r1=32(y1), r2=219(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 32
LDI r2, 219
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
