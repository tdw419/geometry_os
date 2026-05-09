; DESCRIPTION: Draws a orange line from (407, 236) to (506, 21).
; PLAN: r0=407(x1), r1=236(y1), r2=506(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 236
LDI r2, 506
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
