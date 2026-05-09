; DESCRIPTION: Creates a red circular shape at (282, 154) with radius 48.
; PLAN: r0=282(x), r1=154(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 154
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
