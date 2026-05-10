; DESCRIPTION: Composite: Places a black circle of radius 27 at center (211, 149) then Places a red dot at position (386, 240).
; PLAN: r0=211(x), r1=149(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=240(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 149
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 240
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
