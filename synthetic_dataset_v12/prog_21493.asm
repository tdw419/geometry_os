; DESCRIPTION: Draws a orange line from (183, 191) to (361, 105).
; PLAN: r0=183(x1), r1=191(y1), r2=361(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 191
LDI r2, 361
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
