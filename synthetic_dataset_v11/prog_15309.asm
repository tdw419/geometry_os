; DESCRIPTION: Renders a white disk with center (18, 209) and radius 13.
; PLAN: r0=18(x), r1=209(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 209
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
