; DESCRIPTION: Creates a cyan circular shape at (151, 123) with radius 29.
; PLAN: r0=151(x), r1=123(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 123
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
