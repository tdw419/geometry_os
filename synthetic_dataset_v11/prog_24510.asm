; DESCRIPTION: Composite: . Then Places a magenta circle of radius 75 at center (87, 148). Then Draws a magenta rectangle at (199, 37) with width 10 and height 19.
; PLAN: r0=87(x), r1=148(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=199(x), r1=37(y), r2=10(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 75 at center (87, 148).
; PLAN: r0=87(x), r1=148(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 148
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (199, 37) with width 10 and height 19.
; PLAN: r0=199(x), r1=37(y), r2=10(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 37
LDI r2, 10
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
