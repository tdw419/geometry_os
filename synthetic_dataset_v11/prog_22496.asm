; DESCRIPTION: Creates a red circular shape at (184, 56) with radius 56.
; PLAN: r0=184(x), r1=56(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 56
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
