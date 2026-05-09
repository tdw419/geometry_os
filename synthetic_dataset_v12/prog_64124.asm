; DESCRIPTION: Creates a yellow circular shape at (286, 111) with radius 64.
; PLAN: r0=286(x), r1=111(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 111
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
