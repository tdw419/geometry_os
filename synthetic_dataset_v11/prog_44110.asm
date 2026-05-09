; DESCRIPTION: Composite: . Then Places a magenta 116x15 rectangle at position (47, 136). Then Draws a green circle centered at (195, 181) with radius 44.
; PLAN: r0=47(x), r1=136(y), r2=116(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=195(x), r1=181(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 116x15 rectangle at position (47, 136).
; PLAN: r0=47(x), r1=136(y), r2=116(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 136
LDI r2, 116
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (195, 181) with radius 44.
; PLAN: r0=195(x), r1=181(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 181
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
