; DESCRIPTION: Creates a red circular shape at (217, 83) with radius 28.
; PLAN: r0=217(x), r1=83(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 83
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
