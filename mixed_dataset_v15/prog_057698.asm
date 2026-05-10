; DESCRIPTION: Composite: Creates a yellow circular shape at (298, 81) with radius 30 then Places a cyan dot at position (98, 255).
; PLAN: r0=298(x), r1=81(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=255(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 81
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 255
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
