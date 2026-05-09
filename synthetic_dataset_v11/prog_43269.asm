; DESCRIPTION: Creates a yellow circular shape at (171, 165) with radius 72.
; PLAN: r0=171(x), r1=165(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 165
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
