; DESCRIPTION: Composite: Renders a cyan disk with center (333, 127) and radius 13 then Sets a single black pixel at (430, 242).
; PLAN: r0=333(x), r1=127(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=242(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 127
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 242
LDI r7, 0x000000
PSET r5, r6, r7
HALT
