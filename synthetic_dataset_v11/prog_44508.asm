; DESCRIPTION: Creates a yellow circular shape at (127, 191) with radius 39.
; PLAN: r0=127(x), r1=191(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 191
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
