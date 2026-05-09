; DESCRIPTION: Creates a red circular shape at (283, 193) with radius 29.
; PLAN: r0=283(x), r1=193(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 193
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
