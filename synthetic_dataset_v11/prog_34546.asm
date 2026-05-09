; DESCRIPTION: Composite: . Then Draws a black rectangle at (144, 60) with width 15 and height 55. Then Creates a magenta circular shape at (126, 117) with radius 32.
; PLAN: r0=144(x), r1=60(y), r2=15(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=126(x), r1=117(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black rectangle at (144, 60) with width 15 and height 55.
; PLAN: r0=144(x), r1=60(y), r2=15(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 60
LDI r2, 15
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (126, 117) with radius 32.
; PLAN: r0=126(x), r1=117(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 117
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
