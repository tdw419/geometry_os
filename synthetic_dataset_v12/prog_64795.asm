; DESCRIPTION: Renders a black disk with center (213, 50) and radius 45.
; PLAN: r0=213(x), r1=50(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 50
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
