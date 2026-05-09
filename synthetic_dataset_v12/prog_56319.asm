; DESCRIPTION: Places a magenta line segment connecting (84, 219) to (160, 238).
; PLAN: r0=84(x1), r1=219(y1), r2=160(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 219
LDI r2, 160
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
