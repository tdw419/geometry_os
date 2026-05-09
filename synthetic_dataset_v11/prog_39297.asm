; DESCRIPTION: Creates a white circular shape at (191, 164) with radius 56.
; PLAN: r0=191(x), r1=164(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 164
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
