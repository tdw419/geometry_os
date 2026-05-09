; DESCRIPTION: Composite: . Then Draws a green rectangle at (37, 167) with width 111 and height 85. Then Draws a black circle centered at (114, 134) with radius 78.
; PLAN: r0=37(x), r1=167(y), r2=111(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x), r1=134(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (37, 167) with width 111 and height 85.
; PLAN: r0=37(x), r1=167(y), r2=111(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 167
LDI r2, 111
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (114, 134) with radius 78.
; PLAN: r0=114(x), r1=134(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 134
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
