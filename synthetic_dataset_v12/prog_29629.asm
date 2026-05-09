; DESCRIPTION: Renders a white disk with center (15, 228) and radius 14.
; PLAN: r0=15(x), r1=228(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 228
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
