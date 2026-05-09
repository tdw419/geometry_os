; DESCRIPTION: Places a orange line segment connecting (147, 221) to (183, 241).
; PLAN: r0=147(x1), r1=221(y1), r2=183(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 221
LDI r2, 183
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
