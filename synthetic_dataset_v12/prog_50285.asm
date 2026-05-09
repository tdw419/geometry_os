; DESCRIPTION: Creates a green circular shape at (255, 171) with radius 41.
; PLAN: r0=255(x), r1=171(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 171
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
