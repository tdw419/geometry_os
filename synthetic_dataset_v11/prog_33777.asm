; DESCRIPTION: Composite: . Then Draws a orange rectangle at (143, 24) with width 60 and height 83. Then Sets a single magenta pixel at (3, 230).
; PLAN: r0=143(x), r1=24(y), r2=60(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=3(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (143, 24) with width 60 and height 83.
; PLAN: r0=143(x), r1=24(y), r2=60(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 24
LDI r2, 60
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (3, 230).
; PLAN: r0=3(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
