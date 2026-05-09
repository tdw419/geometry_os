; DESCRIPTION: Composite: . Then Creates a red rectangular region at (72, 150) spanning 13 by 67 pixels. Then Draws a magenta circle centered at (41, 175) with radius 39.
; PLAN: r0=72(x), r1=150(y), r2=13(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=175(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (72, 150) spanning 13 by 67 pixels.
; PLAN: r0=72(x), r1=150(y), r2=13(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 150
LDI r2, 13
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (41, 175) with radius 39.
; PLAN: r0=41(x), r1=175(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 175
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
