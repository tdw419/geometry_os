; DESCRIPTION: Renders a white disk with center (212, 164) and radius 37.
; PLAN: r0=212(x), r1=164(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 164
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
