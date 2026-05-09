; DESCRIPTION: Draws a black line from (447, 100) to (501, 252).
; PLAN: r0=447(x1), r1=100(y1), r2=501(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 100
LDI r2, 501
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
