; DESCRIPTION: Draws a green line from (227, 49) to (348, 232).
; PLAN: r0=227(x1), r1=49(y1), r2=348(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 49
LDI r2, 348
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
