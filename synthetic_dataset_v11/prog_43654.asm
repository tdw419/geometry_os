; DESCRIPTION: Composite: . Then Draws a blue rectangle at (30, 113) with width 91 and height 67. Then Places a white circle of radius 10 at center (41, 230).
; PLAN: r0=30(x), r1=113(y), r2=91(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=230(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (30, 113) with width 91 and height 67.
; PLAN: r0=30(x), r1=113(y), r2=91(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 113
LDI r2, 91
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 10 at center (41, 230).
; PLAN: r0=41(x), r1=230(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 230
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
