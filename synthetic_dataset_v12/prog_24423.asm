; DESCRIPTION: Creates a cyan circular shape at (276, 165) with radius 71.
; PLAN: r0=276(x), r1=165(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 165
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
