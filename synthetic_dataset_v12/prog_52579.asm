; DESCRIPTION: Places a orange line segment connecting (175, 61) to (338, 206).
; PLAN: r0=175(x1), r1=61(y1), r2=338(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 61
LDI r2, 338
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
