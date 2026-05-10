; DESCRIPTION: Renders a blue disk with center (442, 173) and radius 41.
; PLAN: r0=442(x), r1=173(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 173
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
