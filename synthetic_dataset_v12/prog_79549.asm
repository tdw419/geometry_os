; DESCRIPTION: Composite: Sets a single blue pixel at (107, 42) then Draws a black rectangle at (78, 90) with width 116 and height 41.
; PLAN: r0=107(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=90(y), r7=116(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 90
LDI r7, 116
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
