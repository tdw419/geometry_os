; DESCRIPTION: Creates a white circular shape at (204, 108) with radius 29.
; PLAN: r0=204(x), r1=108(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 108
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
