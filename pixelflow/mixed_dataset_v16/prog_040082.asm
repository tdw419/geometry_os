; DESCRIPTION: Renders a white disk with center (345, 72) and radius 22.
; PLAN: r0=345(x), r1=72(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 72
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
