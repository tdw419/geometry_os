; DESCRIPTION: Renders a red circular shape at (71, 173) with radius 36.
; PLAN: r0=71(x), r1=173(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 173
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
