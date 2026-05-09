; DESCRIPTION: Places a orange line segment connecting (447, 75) to (27, 178).
; PLAN: r0=447(x1), r1=75(y1), r2=27(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 75
LDI r2, 27
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
