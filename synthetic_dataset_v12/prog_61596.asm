; DESCRIPTION: Composite: Creates a cyan circular shape at (217, 145) with radius 71 then Places a green dot at position (71, 111).
; PLAN: r0=217(x), r1=145(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=111(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 145
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 111
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
