; DESCRIPTION: Renders a white circular shape at (354, 177) with radius 28.
; PLAN: r0=354(x), r1=177(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 177
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
