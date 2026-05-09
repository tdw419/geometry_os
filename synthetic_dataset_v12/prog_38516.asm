; DESCRIPTION: Composite: Places a cyan circle of radius 61 at center (203, 159) then Places a black dot at position (360, 65).
; PLAN: r0=203(x), r1=159(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 159
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
HALT
