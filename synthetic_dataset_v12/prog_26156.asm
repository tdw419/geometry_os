; DESCRIPTION: Draws a orange line from (413, 153) to (448, 234).
; PLAN: r0=413(x1), r1=153(y1), r2=448(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 153
LDI r2, 448
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
