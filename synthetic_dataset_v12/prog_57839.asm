; DESCRIPTION: Composite: Sets a single magenta pixel at (252, 31) then Places a cyan circle of radius 34 at center (85, 147).
; PLAN: r0=252(x), r1=31(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=147(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 31
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 147
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
