; DESCRIPTION: Composite: Sets a single blue pixel at (239, 176) then Places a red 96x67 rectangle at position (19, 5).
; PLAN: r0=239(x), r1=176(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=5(y), r7=96(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 176
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 5
LDI r7, 96
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
