; DESCRIPTION: Places a orange line segment connecting (167, 207) to (218, 219).
; PLAN: r0=167(x1), r1=207(y1), r2=218(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 207
LDI r2, 218
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
