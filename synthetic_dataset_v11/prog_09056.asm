; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (178, 175) with width 28 and height 78. Then Sets a single magenta pixel at (20, 199).
; PLAN: r0=178(x), r1=175(y), r2=28(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x), r1=199(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (178, 175) with width 28 and height 78.
; PLAN: r0=178(x), r1=175(y), r2=28(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 175
LDI r2, 28
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (20, 199).
; PLAN: r0=20(x), r1=199(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 199
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
