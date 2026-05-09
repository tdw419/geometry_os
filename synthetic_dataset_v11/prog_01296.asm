; DESCRIPTION: Composite: . Then Places a black circle of radius 52 at center (176, 125). Then Draws a blue rectangle at (28, 63) with width 90 and height 75.
; PLAN: r0=176(x), r1=125(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=28(x), r1=63(y), r2=90(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 52 at center (176, 125).
; PLAN: r0=176(x), r1=125(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 125
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (28, 63) with width 90 and height 75.
; PLAN: r0=28(x), r1=63(y), r2=90(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 63
LDI r2, 90
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
