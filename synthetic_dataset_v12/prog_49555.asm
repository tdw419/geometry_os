; DESCRIPTION: Places a red circle of radius 19 at center (259, 159).
; PLAN: r0=259(x), r1=159(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 159
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
