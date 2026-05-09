; DESCRIPTION: Renders a white disk with center (46, 188) and radius 44.
; PLAN: r0=46(x), r1=188(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 188
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
