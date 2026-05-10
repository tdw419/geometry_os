; DESCRIPTION: Creates a magenta circular shape at (348, 129) with radius 76.
; PLAN: r0=348(x), r1=129(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 129
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
