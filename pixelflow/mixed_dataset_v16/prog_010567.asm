; DESCRIPTION: Composite: Sets a single yellow pixel at (447, 64) then Places a white 106x97 rectangle at position (285, 109).
; PLAN: r0=447(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=109(y), r7=106(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 109
LDI r7, 106
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
