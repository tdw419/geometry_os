; DESCRIPTION: Composite: . Then Draws a red circle centered at (153, 158) with radius 29. Then Draws a red rectangle at (136, 99) with width 103 and height 118.
; PLAN: r0=153(x), r1=158(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=136(x), r1=99(y), r2=103(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (153, 158) with radius 29.
; PLAN: r0=153(x), r1=158(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 158
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (136, 99) with width 103 and height 118.
; PLAN: r0=136(x), r1=99(y), r2=103(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 99
LDI r2, 103
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
