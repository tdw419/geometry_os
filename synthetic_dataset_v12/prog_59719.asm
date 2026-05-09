; DESCRIPTION: Creates a orange circular shape at (403, 30) with radius 11.
; PLAN: r0=403(x), r1=30(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 30
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
