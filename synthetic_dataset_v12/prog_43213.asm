; DESCRIPTION: Creates a blue circular shape at (197, 137) with radius 71.
; PLAN: r0=197(x), r1=137(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 137
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
