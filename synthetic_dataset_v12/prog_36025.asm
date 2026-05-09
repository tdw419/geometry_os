; DESCRIPTION: Creates a red circular shape at (418, 49) with radius 27.
; PLAN: r0=418(x), r1=49(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 49
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
