; DESCRIPTION: Composite: Places a cyan dot at position (214, 189) then Places a black circle of radius 44 at center (57, 109).
; PLAN: r0=214(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=109(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 189
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 109
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
