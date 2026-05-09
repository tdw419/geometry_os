; DESCRIPTION: Composite: Sets a single yellow pixel at (147, 139) then Draws a cyan circle centered at (300, 149) with radius 21.
; PLAN: r0=147(x), r1=139(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=149(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 139
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 149
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
