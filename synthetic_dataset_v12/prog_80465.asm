; DESCRIPTION: Renders a black disk with center (195, 228) and radius 19.
; PLAN: r0=195(x), r1=228(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 228
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
