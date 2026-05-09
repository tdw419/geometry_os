; DESCRIPTION: Composite: . Then Draws a black rectangle at (8, 190) with width 113 and height 24. Then Sets a single purple pixel at (250, 113).
; PLAN: r0=8(x), r1=190(y), r2=113(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=250(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (8, 190) with width 113 and height 24.
; PLAN: r0=8(x), r1=190(y), r2=113(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 190
LDI r2, 113
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (250, 113).
; PLAN: r0=250(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 113
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
