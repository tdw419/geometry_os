; DESCRIPTION: Renders a white disk with center (84, 46) and radius 32.
; PLAN: r0=84(x), r1=46(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 46
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
