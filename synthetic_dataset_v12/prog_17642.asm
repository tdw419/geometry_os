; DESCRIPTION: Renders a white disk with center (371, 108) and radius 43.
; PLAN: r0=371(x), r1=108(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 108
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
