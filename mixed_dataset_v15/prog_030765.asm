; DESCRIPTION: Creates a yellow circular shape at (361, 192) with radius 27.
; PLAN: r0=361(x), r1=192(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 192
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
