; DESCRIPTION: Renders a white disk with center (117, 99) and radius 32.
; PLAN: r0=117(x), r1=99(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 99
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
