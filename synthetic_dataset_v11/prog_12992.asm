; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (19, 28). Then Draws a blue rectangle at (232, 22) with width 24 and height 19.
; PLAN: r0=19(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=232(x), r1=22(y), r2=24(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (19, 28).
; PLAN: r0=19(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (232, 22) with width 24 and height 19.
; PLAN: r0=232(x), r1=22(y), r2=24(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 22
LDI r2, 24
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
