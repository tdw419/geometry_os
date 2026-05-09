; DESCRIPTION: Composite: Sets a single blue pixel at (353, 254) then Places a red circle of radius 28 at center (126, 91).
; PLAN: r0=353(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=91(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 91
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
