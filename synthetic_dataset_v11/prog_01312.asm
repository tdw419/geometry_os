; DESCRIPTION: Renders a white disk with center (66, 65) and radius 29.
; PLAN: r0=66(x), r1=65(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 65
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
