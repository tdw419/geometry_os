; DESCRIPTION: Draws a orange line from (447, 105) to (421, 180).
; PLAN: r0=447(x1), r1=105(y1), r2=421(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 105
LDI r2, 421
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
