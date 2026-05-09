; DESCRIPTION: Composite: . Then Draws a green circle centered at (118, 90) with radius 69. Then Places a magenta 58x40 rectangle at position (17, 60).
; PLAN: r0=118(x), r1=90(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=17(x), r1=60(y), r2=58(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (118, 90) with radius 69.
; PLAN: r0=118(x), r1=90(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 90
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 58x40 rectangle at position (17, 60).
; PLAN: r0=17(x), r1=60(y), r2=58(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 60
LDI r2, 58
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
