; DESCRIPTION: Creates a cyan circular shape at (391, 165) with radius 62.
; PLAN: r0=391(x), r1=165(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 165
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
