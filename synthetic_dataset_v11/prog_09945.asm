; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (195, 158) with radius 23. Then Draws a blue rectangle at (93, 70) with width 32 and height 67.
; PLAN: r0=195(x), r1=158(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=93(x), r1=70(y), r2=32(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (195, 158) with radius 23.
; PLAN: r0=195(x), r1=158(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 158
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (93, 70) with width 32 and height 67.
; PLAN: r0=93(x), r1=70(y), r2=32(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 70
LDI r2, 32
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
