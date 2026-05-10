; DESCRIPTION: Renders a green disk with center (440, 53) and radius 41.
; PLAN: r0=440(x), r1=53(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 53
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
