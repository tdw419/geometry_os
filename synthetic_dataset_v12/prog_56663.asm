; DESCRIPTION: Creates a green circular shape at (294, 144) with radius 41.
; PLAN: r0=294(x), r1=144(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 144
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
