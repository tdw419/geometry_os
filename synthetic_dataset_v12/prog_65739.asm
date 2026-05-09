; DESCRIPTION: Composite: Sets a single purple pixel at (183, 55) then Places a black circle of radius 72 at center (120, 169).
; PLAN: r0=183(x), r1=55(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=169(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 55
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 169
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
