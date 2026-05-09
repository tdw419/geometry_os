; DESCRIPTION: Creates a green circular shape at (197, 62) with radius 19.
; PLAN: r0=197(x), r1=62(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 62
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
