; DESCRIPTION: Creates a blue circular shape at (405, 112) with radius 71.
; PLAN: r0=405(x), r1=112(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 112
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
