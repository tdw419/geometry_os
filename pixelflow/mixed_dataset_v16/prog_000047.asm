; DESCRIPTION: Renders a green circular shape at (67, 41) with radius 77.
; PLAN: r0=67(x), r1=41(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 41
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
