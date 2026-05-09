; DESCRIPTION: Composite: Sets a single orange pixel at (228, 98) then Places a red circle of radius 39 at center (66, 70).
; PLAN: r0=228(x), r1=98(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=70(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 98
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 66
LDI r6, 70
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
