; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (167, 99) with width 26 and height 114. Then Draws a yellow circle centered at (163, 137) with radius 69.
; PLAN: r0=167(x), r1=99(y), r2=26(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=163(x), r1=137(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (167, 99) with width 26 and height 114.
; PLAN: r0=167(x), r1=99(y), r2=26(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 99
LDI r2, 26
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (163, 137) with radius 69.
; PLAN: r0=163(x), r1=137(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 137
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
