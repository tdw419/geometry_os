; DESCRIPTION: Places a blue line segment connecting (230, 219) to (203, 64).
; PLAN: r0=230(x1), r1=219(y1), r2=203(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 219
LDI r2, 203
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
