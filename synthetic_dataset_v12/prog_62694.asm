; DESCRIPTION: Draws a green line from (241, 159) to (348, 140).
; PLAN: r0=241(x1), r1=159(y1), r2=348(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 159
LDI r2, 348
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
