; DESCRIPTION: Composite: . Then Draws a purple rectangle at (115, 116) with width 28 and height 90. Then Sets a single magenta pixel at (122, 161).
; PLAN: r0=115(x), r1=116(y), r2=28(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=122(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (115, 116) with width 28 and height 90.
; PLAN: r0=115(x), r1=116(y), r2=28(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 116
LDI r2, 28
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (122, 161).
; PLAN: r0=122(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
