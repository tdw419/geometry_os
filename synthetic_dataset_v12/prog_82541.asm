; DESCRIPTION: Renders a white disk with center (384, 126) and radius 64.
; PLAN: r0=384(x), r1=126(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 126
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
