; DESCRIPTION: Renders a red circular shape at (360, 32) with radius 62.
; PLAN: r0=360(x), r1=32(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 32
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
