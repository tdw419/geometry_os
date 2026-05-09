; DESCRIPTION: Creates a red circular shape at (204, 72) with radius 27.
; PLAN: r0=204(x), r1=72(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 72
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
