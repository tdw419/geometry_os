; DESCRIPTION: Creates a yellow circular shape at (91, 86) with radius 30.
; PLAN: r0=91(x), r1=86(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 86
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
