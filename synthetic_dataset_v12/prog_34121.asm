; DESCRIPTION: Composite: Places a blue dot at position (495, 190) then Creates a cyan circular shape at (307, 167) with radius 50.
; PLAN: r0=495(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=167(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 167
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
