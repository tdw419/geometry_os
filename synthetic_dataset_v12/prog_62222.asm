; DESCRIPTION: Places a red circle of radius 79 at center (407, 159).
; PLAN: r0=407(x), r1=159(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 159
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
