; DESCRIPTION: Composite: Creates a cyan circular shape at (143, 99) with radius 22 then Places a black dot at position (45, 29).
; PLAN: r0=143(x), r1=99(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=29(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 99
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 29
LDI r7, 0x000000
PSET r5, r6, r7
HALT
