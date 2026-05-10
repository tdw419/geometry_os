; DESCRIPTION: Composite: Places a purple circle of radius 26 at center (101, 37) then Places a cyan dot at position (10, 125).
; PLAN: r0=101(x), r1=37(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 37
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
