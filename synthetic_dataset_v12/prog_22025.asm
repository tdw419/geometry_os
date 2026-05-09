; DESCRIPTION: Composite: Sets a single yellow pixel at (476, 172) then Places a white 45x27 rectangle at position (415, 209).
; PLAN: r0=476(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=209(y), r7=45(width), r8=27(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 415
LDI r6, 209
LDI r7, 45
LDI r8, 27
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
