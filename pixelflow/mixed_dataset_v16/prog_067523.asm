; DESCRIPTION: Composite: Sets a single cyan pixel at (453, 134) then Places a magenta circle of radius 26 at center (378, 109).
; PLAN: r0=453(x), r1=134(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=109(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 453
LDI r1, 134
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 109
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
