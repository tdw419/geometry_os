; DESCRIPTION: Composite: . Then Sets a single purple pixel at (41, 218). Then Draws a white rectangle at (168, 8) with width 78 and height 107.
; PLAN: r0=41(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=168(x), r1=8(y), r2=78(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (41, 218).
; PLAN: r0=41(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (168, 8) with width 78 and height 107.
; PLAN: r0=168(x), r1=8(y), r2=78(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 8
LDI r2, 78
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
