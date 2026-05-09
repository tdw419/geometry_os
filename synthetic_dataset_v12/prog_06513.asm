; DESCRIPTION: Creates a cyan circular shape at (217, 101) with radius 14.
; PLAN: r0=217(x), r1=101(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 101
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
