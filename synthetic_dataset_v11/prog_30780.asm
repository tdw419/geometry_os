; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (171, 49) with width 40 and height 60. Then Places a white circle of radius 27 at center (37, 84).
; PLAN: r0=171(x), r1=49(y), r2=40(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=37(x), r1=84(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (171, 49) with width 40 and height 60.
; PLAN: r0=171(x), r1=49(y), r2=40(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 49
LDI r2, 40
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 27 at center (37, 84).
; PLAN: r0=37(x), r1=84(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 84
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
