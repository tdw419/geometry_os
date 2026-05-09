; DESCRIPTION: Draws a orange line from (130, 253) to (203, 218).
; PLAN: r0=130(x1), r1=253(y1), r2=203(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 253
LDI r2, 203
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
