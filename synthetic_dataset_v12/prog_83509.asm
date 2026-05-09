; DESCRIPTION: Draws a orange line from (173, 48) to (129, 203).
; PLAN: r0=173(x1), r1=48(y1), r2=129(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 48
LDI r2, 129
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
