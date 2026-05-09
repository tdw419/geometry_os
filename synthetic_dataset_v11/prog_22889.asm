; DESCRIPTION: Creates a cyan circular shape at (172, 165) with radius 13.
; PLAN: r0=172(x), r1=165(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 165
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
