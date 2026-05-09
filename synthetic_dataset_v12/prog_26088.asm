; DESCRIPTION: Draws a orange line from (503, 56) to (204, 156).
; PLAN: r0=503(x1), r1=56(y1), r2=204(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 56
LDI r2, 204
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
