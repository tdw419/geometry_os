; DESCRIPTION: Composite: . Then Sets a single purple pixel at (176, 37). Then Draws a magenta rectangle at (156, 105) with width 82 and height 90.
; PLAN: r0=176(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=105(y), r2=82(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (176, 37).
; PLAN: r0=176(x), r1=37(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 37
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (156, 105) with width 82 and height 90.
; PLAN: r0=156(x), r1=105(y), r2=82(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 105
LDI r2, 82
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
