; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (104, 141) with width 101 and height 90. Then Creates a green circular shape at (76, 68) with radius 47.
; PLAN: r0=104(x), r1=141(y), r2=101(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=76(x), r1=68(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (104, 141) with width 101 and height 90.
; PLAN: r0=104(x), r1=141(y), r2=101(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 141
LDI r2, 101
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (76, 68) with radius 47.
; PLAN: r0=76(x), r1=68(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 68
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
