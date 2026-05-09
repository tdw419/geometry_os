; DESCRIPTION: Composite: . Then Draws a purple rectangle at (2, 152) with width 53 and height 39. Then Draws a magenta circle centered at (74, 159) with radius 70.
; PLAN: r0=2(x), r1=152(y), r2=53(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x), r1=159(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (2, 152) with width 53 and height 39.
; PLAN: r0=2(x), r1=152(y), r2=53(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 152
LDI r2, 53
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (74, 159) with radius 70.
; PLAN: r0=74(x), r1=159(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 159
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
