; DESCRIPTION: Draws a orange line from (176, 174) to (56, 191).
; PLAN: r0=176(x1), r1=174(y1), r2=56(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 174
LDI r2, 56
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
