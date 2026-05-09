; DESCRIPTION: Places a orange line segment connecting (187, 219) to (64, 178).
; PLAN: r0=187(x1), r1=219(y1), r2=64(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 219
LDI r2, 64
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
