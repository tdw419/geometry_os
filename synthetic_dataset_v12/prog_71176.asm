; DESCRIPTION: Renders a white disk with center (91, 167) and radius 79.
; PLAN: r0=91(x), r1=167(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 167
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
