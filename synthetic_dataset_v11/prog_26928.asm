; DESCRIPTION: Renders a blue disk with center (239, 148) and radius 13.
; PLAN: r0=239(x), r1=148(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 148
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
