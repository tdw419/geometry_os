; DESCRIPTION: Places a orange line segment connecting (138, 128) to (128, 60).
; PLAN: r0=138(x1), r1=128(y1), r2=128(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 128
LDI r2, 128
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
