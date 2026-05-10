; DESCRIPTION: Composite: Places a black circle of radius 54 at center (350, 85) then Places a cyan dot at position (444, 115).
; PLAN: r0=350(x), r1=85(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 85
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
