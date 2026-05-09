; DESCRIPTION: Creates a red circular shape at (329, 157) with radius 35.
; PLAN: r0=329(x), r1=157(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 157
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
