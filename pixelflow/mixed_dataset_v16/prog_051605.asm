; DESCRIPTION: Composite: Sets a single yellow pixel at (291, 45) then Places a cyan circle of radius 42 at center (126, 140).
; PLAN: r0=291(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=140(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 291
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 126
LDI r6, 140
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
