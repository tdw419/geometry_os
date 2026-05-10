; DESCRIPTION: Places a orange line segment connecting (447, 113) to (79, 115).
; PLAN: r0=447(x1), r1=113(y1), r2=79(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 113
LDI r2, 79
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
