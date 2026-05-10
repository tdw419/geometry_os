; DESCRIPTION: Draws a orange line from (358, 191) to (347, 74).
; PLAN: r0=358(x1), r1=191(y1), r2=347(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 191
LDI r2, 347
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
