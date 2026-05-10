; DESCRIPTION: Creates a red circular shape at (245, 181) with radius 37.
; PLAN: r0=245(x), r1=181(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 181
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
