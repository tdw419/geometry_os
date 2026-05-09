; DESCRIPTION: Composite: . Then Draws a green rectangle at (78, 210) with width 69 and height 40. Then Draws a red circle centered at (136, 100) with radius 28.
; PLAN: r0=78(x), r1=210(y), r2=69(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=136(x), r1=100(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (78, 210) with width 69 and height 40.
; PLAN: r0=78(x), r1=210(y), r2=69(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 210
LDI r2, 69
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (136, 100) with radius 28.
; PLAN: r0=136(x), r1=100(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 100
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
