; DESCRIPTION: Creates a green circular shape at (254, 46) with radius 19.
; PLAN: r0=254(x), r1=46(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 46
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
