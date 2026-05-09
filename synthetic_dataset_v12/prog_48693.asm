; DESCRIPTION: Composite: Places a orange dot at position (498, 239) then Draws a white rectangle at (417, 6) with width 28 and height 82.
; PLAN: r0=498(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=6(y), r7=28(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 417
LDI r6, 6
LDI r7, 28
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
