; DESCRIPTION: Renders a red circular shape at (373, 164) with radius 52.
; PLAN: r0=373(x), r1=164(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 164
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
