; DESCRIPTION: Renders a green disk with center (76, 209) and radius 41.
; PLAN: r0=76(x), r1=209(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 209
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
