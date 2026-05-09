; DESCRIPTION: Renders a black disk with center (410, 177) and radius 43.
; PLAN: r0=410(x), r1=177(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 177
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
