; DESCRIPTION: Composite: Sets a single cyan pixel at (239, 96) then Renders a cyan disk with center (291, 126) and radius 41.
; PLAN: r0=239(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=126(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 126
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
