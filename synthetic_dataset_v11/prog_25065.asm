; DESCRIPTION: Composite: . Then Draws a white rectangle at (150, 54) with width 103 and height 98. Then Places a magenta circle of radius 11 at center (236, 198).
; PLAN: r0=150(x), r1=54(y), r2=103(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=236(x), r1=198(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (150, 54) with width 103 and height 98.
; PLAN: r0=150(x), r1=54(y), r2=103(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 54
LDI r2, 103
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 11 at center (236, 198).
; PLAN: r0=236(x), r1=198(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 198
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
