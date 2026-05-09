; DESCRIPTION: Composite: Places a cyan circle of radius 66 at center (70, 99) then Sets a single purple pixel at (361, 95).
; PLAN: r0=70(x), r1=99(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=95(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 99
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 95
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
