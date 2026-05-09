; DESCRIPTION: Composite: Sets a single purple pixel at (32, 167) then Creates a cyan rectangular region at (322, 44) spanning 45 by 110 pixels.
; PLAN: r0=32(x), r1=167(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=44(y), r7=45(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 167
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 44
LDI r7, 45
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
