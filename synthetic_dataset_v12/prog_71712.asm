; DESCRIPTION: Composite: Sets a single orange pixel at (253, 239) then Places a black 81x120 rectangle at position (418, 93).
; PLAN: r0=253(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=93(y), r7=81(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 418
LDI r6, 93
LDI r7, 81
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
