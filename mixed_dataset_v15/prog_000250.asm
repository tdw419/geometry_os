; DESCRIPTION: Places a blue line segment connecting (382, 219) to (471, 241).
; PLAN: r0=382(x1), r1=219(y1), r2=471(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 219
LDI r2, 471
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
