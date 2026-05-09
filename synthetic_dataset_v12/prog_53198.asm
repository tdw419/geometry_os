; DESCRIPTION: Renders a white disk with center (279, 143) and radius 49.
; PLAN: r0=279(x), r1=143(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 143
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
