; DESCRIPTION: Places a purple line segment connecting (440, 78) to (141, 219).
; PLAN: r0=440(x1), r1=78(y1), r2=141(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 78
LDI r2, 141
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
