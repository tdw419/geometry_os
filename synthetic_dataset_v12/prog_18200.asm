; DESCRIPTION: Renders a black disk with center (193, 150) and radius 41.
; PLAN: r0=193(x), r1=150(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 150
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
