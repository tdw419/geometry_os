; DESCRIPTION: Places a yellow line segment connecting (484, 19) to (66, 219).
; PLAN: r0=484(x1), r1=19(y1), r2=66(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 19
LDI r2, 66
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
