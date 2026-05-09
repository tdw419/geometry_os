; DESCRIPTION: Draws a orange line from (191, 2) to (97, 241).
; PLAN: r0=191(x1), r1=2(y1), r2=97(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 2
LDI r2, 97
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
