; DESCRIPTION: Renders a white disk with center (69, 87) and radius 32.
; PLAN: r0=69(x), r1=87(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 87
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
