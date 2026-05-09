; DESCRIPTION: Renders a green disk with center (103, 41) and radius 36.
; PLAN: r0=103(x), r1=41(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 41
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
