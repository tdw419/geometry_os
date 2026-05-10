; DESCRIPTION: Composite: Places a white dot at position (7, 5) then Places a black circle of radius 72 at center (100, 123).
; PLAN: r0=7(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=123(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 123
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
