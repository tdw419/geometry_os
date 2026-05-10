; DESCRIPTION: Places a orange line segment connecting (80, 172) to (326, 95).
; PLAN: r0=80(x1), r1=172(y1), r2=326(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 172
LDI r2, 326
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
