; DESCRIPTION: Composite: . Then Creates a green circular shape at (109, 125) with radius 78. Then Draws a blue rectangle at (82, 24) with width 25 and height 22.
; PLAN: r0=109(x), r1=125(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=82(x), r1=24(y), r2=25(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (109, 125) with radius 78.
; PLAN: r0=109(x), r1=125(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 125
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (82, 24) with width 25 and height 22.
; PLAN: r0=82(x), r1=24(y), r2=25(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 24
LDI r2, 25
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
