; DESCRIPTION: Composite: Sets a single yellow pixel at (164, 248) then Places a white 79x64 rectangle at position (267, 72).
; PLAN: r0=164(x), r1=248(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=72(y), r7=79(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 248
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 267
LDI r6, 72
LDI r7, 79
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
