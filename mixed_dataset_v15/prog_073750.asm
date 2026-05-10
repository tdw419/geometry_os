; DESCRIPTION: Composite: Creates a yellow circular shape at (263, 172) with radius 80 then Places a cyan dot at position (469, 255).
; PLAN: r0=263(x), r1=172(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=255(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 172
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 255
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
