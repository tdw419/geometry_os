; DESCRIPTION: Renders a orange disk with center (379, 151) and radius 41.
; PLAN: r0=379(x), r1=151(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 151
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
