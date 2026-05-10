; DESCRIPTION: Composite: Renders a cyan disk with center (358, 42) and radius 39 then Sets a single orange pixel at (364, 48).
; PLAN: r0=358(x), r1=42(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=48(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 42
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 48
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
