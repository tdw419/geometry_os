; DESCRIPTION: Renders a black disk with center (82, 202) and radius 24.
; PLAN: r0=82(x), r1=202(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 202
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
