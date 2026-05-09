; DESCRIPTION: Creates a blue circular shape at (245, 153) with radius 44.
; PLAN: r0=245(x), r1=153(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 153
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
