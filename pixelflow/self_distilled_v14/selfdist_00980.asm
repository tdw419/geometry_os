; DESCRIPTION: Renders a red circular shape at (256, 61) with radius 49.
; PLAN: r0=256(x), r1=61(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 61
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
