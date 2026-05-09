; DESCRIPTION: Renders a black disk with center (429, 73) and radius 68.
; PLAN: r0=429(x), r1=73(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 73
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
