; DESCRIPTION: Renders a yellow disk with center (252, 173) and radius 41.
; PLAN: r0=252(x), r1=173(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 173
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
