; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (13, 3) with width 114 and height 77. Then Draws a blue circle centered at (139, 168) with radius 52.
; PLAN: r0=13(x), r1=3(y), r2=114(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=139(x), r1=168(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (13, 3) with width 114 and height 77.
; PLAN: r0=13(x), r1=3(y), r2=114(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 3
LDI r2, 114
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (139, 168) with radius 52.
; PLAN: r0=139(x), r1=168(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 168
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
