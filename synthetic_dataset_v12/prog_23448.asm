; DESCRIPTION: Composite: Sets a single cyan pixel at (105, 109) then Places a green circle of radius 39 at center (227, 105).
; PLAN: r0=105(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=105(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 105
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
