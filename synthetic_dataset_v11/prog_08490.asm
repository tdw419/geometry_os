; DESCRIPTION: Creates a yellow circular shape at (104, 80) with radius 78.
; PLAN: r0=104(x), r1=80(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 80
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
