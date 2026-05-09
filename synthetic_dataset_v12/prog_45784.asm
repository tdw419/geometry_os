; DESCRIPTION: Creates a yellow circular shape at (117, 144) with radius 39.
; PLAN: r0=117(x), r1=144(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 144
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
