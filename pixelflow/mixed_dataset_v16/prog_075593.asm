; DESCRIPTION: Composite: Creates a cyan circular shape at (144, 150) with radius 62 then Sets a single purple pixel at (7, 202).
; PLAN: r0=144(x), r1=150(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=202(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 150
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 202
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
