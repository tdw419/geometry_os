; DESCRIPTION: Places a orange line segment connecting (118, 222) to (1, 219).
; PLAN: r0=118(x1), r1=222(y1), r2=1(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 222
LDI r2, 1
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
