; DESCRIPTION: Composite: Sets a single yellow pixel at (9, 126) then Places a white 49x119 rectangle at position (226, 96).
; PLAN: r0=9(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=96(y), r7=49(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 226
LDI r6, 96
LDI r7, 49
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
