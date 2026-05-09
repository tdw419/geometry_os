; DESCRIPTION: Creates a yellow circular shape at (360, 176) with radius 78.
; PLAN: r0=360(x), r1=176(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 176
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
