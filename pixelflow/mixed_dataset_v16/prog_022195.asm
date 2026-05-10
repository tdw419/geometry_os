; DESCRIPTION: Creates a yellow circular shape at (65, 103) with radius 37.
; PLAN: r0=65(x), r1=103(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 103
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
