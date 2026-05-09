; DESCRIPTION: Creates a yellow circular shape at (299, 135) with radius 56.
; PLAN: r0=299(x), r1=135(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 135
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
