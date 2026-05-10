; DESCRIPTION: Composite: Places a orange circle of radius 65 at center (126, 182) then Places a blue dot at position (143, 132).
; PLAN: r0=126(x), r1=182(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=132(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 182
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 132
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
