; DESCRIPTION: Places a yellow line segment connecting (383, 41) to (100, 219).
; PLAN: r0=383(x1), r1=41(y1), r2=100(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 41
LDI r2, 100
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
