; DESCRIPTION: Creates a blue circular shape at (114, 44) with radius 32.
; PLAN: r0=114(x), r1=44(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 44
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
