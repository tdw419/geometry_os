; DESCRIPTION: Composite: Places a cyan circle of radius 56 at center (164, 197) then Places a cyan dot at position (499, 4).
; PLAN: r0=164(x), r1=197(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=4(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 197
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 4
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
