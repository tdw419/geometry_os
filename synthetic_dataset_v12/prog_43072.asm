; DESCRIPTION: Renders a white disk with center (279, 102) and radius 65.
; PLAN: r0=279(x), r1=102(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 102
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
