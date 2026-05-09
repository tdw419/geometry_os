; DESCRIPTION: Places a orange line segment connecting (421, 233) to (499, 128).
; PLAN: r0=421(x1), r1=233(y1), r2=499(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 233
LDI r2, 499
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
