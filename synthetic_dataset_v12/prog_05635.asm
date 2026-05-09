; DESCRIPTION: Creates a cyan circular shape at (391, 166) with radius 37.
; PLAN: r0=391(x), r1=166(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 166
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
