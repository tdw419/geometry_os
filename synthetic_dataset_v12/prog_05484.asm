; DESCRIPTION: Composite: Renders a cyan disk with center (225, 175) and radius 32 then Sets a single purple pixel at (354, 214).
; PLAN: r0=225(x), r1=175(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=214(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 175
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 214
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
