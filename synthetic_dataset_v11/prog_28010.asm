; DESCRIPTION: Composite: . Then Sets a single purple pixel at (50, 6). Then Draws a purple rectangle at (49, 26) with width 34 and height 47.
; PLAN: r0=50(x), r1=6(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=49(x), r1=26(y), r2=34(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (50, 6).
; PLAN: r0=50(x), r1=6(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 6
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple rectangle at (49, 26) with width 34 and height 47.
; PLAN: r0=49(x), r1=26(y), r2=34(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 26
LDI r2, 34
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
