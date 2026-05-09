; DESCRIPTION: Creates a yellow circular shape at (247, 135) with radius 21.
; PLAN: r0=247(x), r1=135(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 135
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
