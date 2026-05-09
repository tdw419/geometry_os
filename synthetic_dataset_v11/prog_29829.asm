; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (144, 98) with width 101 and height 26. Then Draws a magenta circle centered at (175, 132) with radius 78.
; PLAN: r0=144(x), r1=98(y), r2=101(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=132(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (144, 98) with width 101 and height 26.
; PLAN: r0=144(x), r1=98(y), r2=101(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 98
LDI r2, 101
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (175, 132) with radius 78.
; PLAN: r0=175(x), r1=132(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 132
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
