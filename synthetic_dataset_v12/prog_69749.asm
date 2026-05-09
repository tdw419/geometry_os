; DESCRIPTION: Composite: Places a yellow dot at position (224, 210) then Draws a cyan circle centered at (311, 153) with radius 31.
; PLAN: r0=224(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=153(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 224
LDI r1, 210
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 311
LDI r6, 153
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
