; DESCRIPTION: Places a orange line segment connecting (294, 221) to (496, 232).
; PLAN: r0=294(x1), r1=221(y1), r2=496(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 221
LDI r2, 496
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
