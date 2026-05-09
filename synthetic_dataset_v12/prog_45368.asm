; DESCRIPTION: Composite: Renders a cyan disk with center (449, 93) and radius 28 then Places a purple dot at position (350, 110).
; PLAN: r0=449(x), r1=93(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=110(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 449
LDI r1, 93
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 110
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
