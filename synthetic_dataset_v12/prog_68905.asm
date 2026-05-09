; DESCRIPTION: Composite: Sets a single cyan pixel at (121, 68) then Renders a cyan disk with center (324, 179) and radius 62.
; PLAN: r0=121(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=179(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 179
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
