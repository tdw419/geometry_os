; DESCRIPTION: Creates a yellow circular shape at (174, 139) with radius 65.
; PLAN: r0=174(x), r1=139(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 139
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
