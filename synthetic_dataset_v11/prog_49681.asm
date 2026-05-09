; DESCRIPTION: Composite: . Then Draws a blue rectangle at (30, 25) with width 107 and height 110. Then Creates a magenta circular shape at (96, 136) with radius 40.
; PLAN: r0=30(x), r1=25(y), r2=107(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=96(x), r1=136(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (30, 25) with width 107 and height 110.
; PLAN: r0=30(x), r1=25(y), r2=107(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 25
LDI r2, 107
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (96, 136) with radius 40.
; PLAN: r0=96(x), r1=136(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 136
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
