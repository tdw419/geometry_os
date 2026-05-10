; DESCRIPTION: Composite: Creates a cyan circular shape at (209, 170) with radius 13 then Places a black dot at position (108, 172).
; PLAN: r0=209(x), r1=170(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=172(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 170
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 172
LDI r7, 0x000000
PSET r5, r6, r7
HALT
