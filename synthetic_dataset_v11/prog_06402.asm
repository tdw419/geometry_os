; DESCRIPTION: Renders a white disk with center (154, 98) and radius 69.
; PLAN: r0=154(x), r1=98(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 98
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
