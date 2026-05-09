; DESCRIPTION: Composite: Sets a single orange pixel at (445, 3) then Places a cyan circle of radius 72 at center (250, 116).
; PLAN: r0=445(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=116(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 250
LDI r6, 116
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
