; DESCRIPTION: Composite: Sets a single purple pixel at (375, 190) then Renders a blue disk with center (62, 191) and radius 32.
; PLAN: r0=375(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=191(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 191
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
