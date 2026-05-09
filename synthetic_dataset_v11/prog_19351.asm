; DESCRIPTION: Composite: . Then Sets a single black pixel at (251, 7). Then Draws a orange rectangle at (183, 172) with width 24 and height 82.
; PLAN: r0=251(x), r1=7(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=183(x), r1=172(y), r2=24(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (251, 7).
; PLAN: r0=251(x), r1=7(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 7
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (183, 172) with width 24 and height 82.
; PLAN: r0=183(x), r1=172(y), r2=24(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 172
LDI r2, 24
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
