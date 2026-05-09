; DESCRIPTION: Composite: Places a red circle of radius 72 at center (122, 154) then Sets a single purple pixel at (3, 125).
; PLAN: r0=122(x), r1=154(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=125(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 154
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 125
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
