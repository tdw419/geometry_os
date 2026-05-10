; DESCRIPTION: Renders a red circular shape at (32, 116) with radius 76.
; PLAN: r0=32(x), r1=116(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 116
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
