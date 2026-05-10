; DESCRIPTION: Draws a yellow line from (348, 63) to (159, 129).
; PLAN: r0=348(x1), r1=63(y1), r2=159(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 63
LDI r2, 159
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
