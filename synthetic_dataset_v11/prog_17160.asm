; DESCRIPTION: Composite: . Then Draws a green rectangle at (103, 4) with width 35 and height 88. Then Draws a blue circle centered at (198, 166) with radius 28.
; PLAN: r0=103(x), r1=4(y), r2=35(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=198(x), r1=166(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (103, 4) with width 35 and height 88.
; PLAN: r0=103(x), r1=4(y), r2=35(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 4
LDI r2, 35
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (198, 166) with radius 28.
; PLAN: r0=198(x), r1=166(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 166
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
