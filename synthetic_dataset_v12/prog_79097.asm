; DESCRIPTION: Creates a white circular shape at (310, 126) with radius 50.
; PLAN: r0=310(x), r1=126(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 126
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
