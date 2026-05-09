; DESCRIPTION: Renders a black disk with center (405, 111) and radius 34.
; PLAN: r0=405(x), r1=111(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 111
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
