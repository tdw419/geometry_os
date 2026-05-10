; DESCRIPTION: Creates a yellow circular shape at (197, 227) with radius 13.
; PLAN: r0=197(x), r1=227(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 227
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
