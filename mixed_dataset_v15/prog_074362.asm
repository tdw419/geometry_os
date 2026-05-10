; DESCRIPTION: Renders a white disk with center (254, 154) and radius 23.
; PLAN: r0=254(x), r1=154(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 154
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
