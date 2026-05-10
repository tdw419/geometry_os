; DESCRIPTION: Renders a white disk with center (223, 162) and radius 64.
; PLAN: r0=223(x), r1=162(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 162
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
