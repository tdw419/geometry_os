; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (137, 54) with width 111 and height 18. Then Creates a blue circular shape at (86, 167) with radius 80.
; PLAN: r0=137(x), r1=54(y), r2=111(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=86(x), r1=167(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (137, 54) with width 111 and height 18.
; PLAN: r0=137(x), r1=54(y), r2=111(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 54
LDI r2, 111
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (86, 167) with radius 80.
; PLAN: r0=86(x), r1=167(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 167
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
