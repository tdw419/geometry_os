; DESCRIPTION: Composite: Places a blue dot at position (48, 31) then Creates a cyan circular shape at (311, 161) with radius 68.
; PLAN: r0=48(x), r1=31(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=161(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 31
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 161
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
