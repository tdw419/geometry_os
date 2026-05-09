; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (16, 68) with width 78 and height 109. Then Places a blue circle of radius 18 at center (54, 88).
; PLAN: r0=16(x), r1=68(y), r2=78(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=54(x), r1=88(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (16, 68) with width 78 and height 109.
; PLAN: r0=16(x), r1=68(y), r2=78(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 68
LDI r2, 78
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 18 at center (54, 88).
; PLAN: r0=54(x), r1=88(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 88
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
