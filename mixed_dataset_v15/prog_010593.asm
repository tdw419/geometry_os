; DESCRIPTION: Creates a yellow circular shape at (173, 57) with radius 20.
; PLAN: r0=173(x), r1=57(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 57
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
