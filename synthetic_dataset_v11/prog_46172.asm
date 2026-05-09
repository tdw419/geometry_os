; DESCRIPTION: Composite: . Then Places a blue circle of radius 58 at center (62, 148). Then Draws a black rectangle at (127, 196) with width 40 and height 53.
; PLAN: r0=62(x), r1=148(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x), r1=196(y), r2=40(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 58 at center (62, 148).
; PLAN: r0=62(x), r1=148(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 148
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (127, 196) with width 40 and height 53.
; PLAN: r0=127(x), r1=196(y), r2=40(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 196
LDI r2, 40
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
