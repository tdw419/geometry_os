; DESCRIPTION: Composite: Places a cyan circle of radius 22 at center (265, 158) then Places a yellow dot at position (278, 200).
; PLAN: r0=265(x), r1=158(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 158
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
