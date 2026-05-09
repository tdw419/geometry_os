; DESCRIPTION: Renders a red disk with center (265, 77) and radius 41.
; PLAN: r0=265(x), r1=77(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 77
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
