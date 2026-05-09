; DESCRIPTION: Renders a white disk with center (381, 150) and radius 69.
; PLAN: r0=381(x), r1=150(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 150
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
