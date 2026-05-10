; DESCRIPTION: Creates a yellow circular shape at (409, 173) with radius 77.
; PLAN: r0=409(x), r1=173(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 173
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
