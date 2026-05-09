; DESCRIPTION: Composite: Places a red dot at position (11, 114) then Places a black circle of radius 10 at center (49, 27).
; PLAN: r0=11(x), r1=114(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=27(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 114
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 49
LDI r6, 27
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
