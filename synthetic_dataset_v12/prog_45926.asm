; DESCRIPTION: Composite: Places a red circle of radius 17 at center (399, 92) then Places a black dot at position (154, 242).
; PLAN: r0=399(x), r1=92(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=242(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 92
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 242
LDI r7, 0x000000
PSET r5, r6, r7
HALT
