; DESCRIPTION: Draws a orange line from (1, 218) to (230, 52).
; PLAN: r0=1(x1), r1=218(y1), r2=230(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 218
LDI r2, 230
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
