; DESCRIPTION: Creates a red circular shape at (408, 159) with radius 39.
; PLAN: r0=408(x), r1=159(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 159
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
