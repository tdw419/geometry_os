; DESCRIPTION: Composite: . Then Creates a blue circular shape at (41, 166) with radius 24. Then Draws a magenta rectangle at (99, 85) with width 84 and height 89.
; PLAN: r0=41(x), r1=166(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=99(x), r1=85(y), r2=84(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (41, 166) with radius 24.
; PLAN: r0=41(x), r1=166(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 166
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (99, 85) with width 84 and height 89.
; PLAN: r0=99(x), r1=85(y), r2=84(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 85
LDI r2, 84
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
