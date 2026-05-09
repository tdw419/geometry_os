; DESCRIPTION: Composite: Sets a single green pixel at (469, 94) then Places a purple 71x42 rectangle at position (232, 204).
; PLAN: r0=469(x), r1=94(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=204(y), r7=71(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 94
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 232
LDI r6, 204
LDI r7, 71
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
