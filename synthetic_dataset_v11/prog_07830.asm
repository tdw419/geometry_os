; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (113, 143) with width 26 and height 62. Then Creates a magenta circular shape at (192, 136) with radius 61.
; PLAN: r0=113(x), r1=143(y), r2=26(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=192(x), r1=136(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (113, 143) with width 26 and height 62.
; PLAN: r0=113(x), r1=143(y), r2=26(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 143
LDI r2, 26
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (192, 136) with radius 61.
; PLAN: r0=192(x), r1=136(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 136
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
