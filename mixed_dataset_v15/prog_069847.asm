; DESCRIPTION: Creates a green circular shape at (410, 76) with radius 32.
; PLAN: r0=410(x), r1=76(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 76
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
