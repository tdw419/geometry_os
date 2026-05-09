; DESCRIPTION: Places a black line segment connecting (21, 219) to (36, 74).
; PLAN: r0=21(x1), r1=219(y1), r2=36(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 219
LDI r2, 36
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
