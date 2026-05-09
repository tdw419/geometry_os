; DESCRIPTION: Creates a yellow circular shape at (410, 64) with radius 18.
; PLAN: r0=410(x), r1=64(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 64
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
