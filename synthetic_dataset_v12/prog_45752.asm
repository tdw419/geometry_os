; DESCRIPTION: Creates a red circular shape at (253, 117) with radius 29.
; PLAN: r0=253(x), r1=117(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 117
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
