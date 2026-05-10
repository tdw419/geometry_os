; DESCRIPTION: Renders a red circular shape at (299, 40) with radius 75.
; PLAN: r0=299(x), r1=40(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 40
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
