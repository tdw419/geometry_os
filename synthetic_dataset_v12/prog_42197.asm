; DESCRIPTION: Composite: Draws a green rectangle at (324, 191) with width 61 and height 43 then Places a red dot at position (471, 113).
; PLAN: r0=324(x), r1=191(y), r2=61(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x), r6=113(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 191
LDI r2, 61
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 113
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
