; DESCRIPTION: Creates a green circular shape at (214, 86) with radius 38.
; PLAN: r0=214(x), r1=86(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 86
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
