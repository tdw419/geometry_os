; DESCRIPTION: Renders a red circular shape at (256, 74) with radius 35.
; PLAN: r0=256(x), r1=74(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 74
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
