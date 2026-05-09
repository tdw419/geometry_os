; DESCRIPTION: Composite: . Then Sets a single white pixel at (146, 130). Then Draws a purple rectangle at (8, 111) with width 41 and height 113.
; PLAN: r0=146(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=8(x), r1=111(y), r2=41(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (146, 130).
; PLAN: r0=146(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 130
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple rectangle at (8, 111) with width 41 and height 113.
; PLAN: r0=8(x), r1=111(y), r2=41(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 111
LDI r2, 41
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
