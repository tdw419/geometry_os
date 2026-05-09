; DESCRIPTION: Renders a white disk with center (154, 53) and radius 34.
; PLAN: r0=154(x), r1=53(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 53
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
