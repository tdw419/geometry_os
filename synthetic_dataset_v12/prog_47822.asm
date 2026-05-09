; DESCRIPTION: Creates a white circular shape at (482, 159) with radius 24.
; PLAN: r0=482(x), r1=159(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 159
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
