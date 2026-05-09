; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (230, 186) with radius 26. Then Draws a red rectangle at (52, 128) with width 41 and height 73.
; PLAN: r0=230(x), r1=186(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x), r1=128(y), r2=41(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (230, 186) with radius 26.
; PLAN: r0=230(x), r1=186(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 186
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (52, 128) with width 41 and height 73.
; PLAN: r0=52(x), r1=128(y), r2=41(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 128
LDI r2, 41
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
