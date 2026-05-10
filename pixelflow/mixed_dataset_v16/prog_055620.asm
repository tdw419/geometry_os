; DESCRIPTION: Renders a red circular shape at (120, 39) with radius 18.
; PLAN: r0=120(x), r1=39(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 39
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
