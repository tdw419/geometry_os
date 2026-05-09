; DESCRIPTION: Composite: . Then Draws a green circle centered at (86, 181) with radius 61. Then Places a blue 67x62 rectangle at position (11, 50).
; PLAN: r0=86(x), r1=181(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=11(x), r1=50(y), r2=67(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (86, 181) with radius 61.
; PLAN: r0=86(x), r1=181(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 181
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 67x62 rectangle at position (11, 50).
; PLAN: r0=11(x), r1=50(y), r2=67(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 50
LDI r2, 67
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
