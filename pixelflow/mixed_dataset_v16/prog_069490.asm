; DESCRIPTION: Composite: Creates a cyan circular shape at (40, 31) with radius 24 then Places a green dot at position (363, 240).
; PLAN: r0=40(x), r1=31(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=240(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 31
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 240
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
