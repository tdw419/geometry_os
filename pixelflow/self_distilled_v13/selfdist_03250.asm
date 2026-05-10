; DESCRIPTION: Renders a red circular shape at (87, 172) with radius 41.
; PLAN: r0=87(x), r1=172(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 172
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
