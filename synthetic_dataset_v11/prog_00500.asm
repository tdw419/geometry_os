; DESCRIPTION: Composite: . Then Places a green circle of radius 76 at center (87, 90). Then Draws a yellow rectangle at (134, 0) with width 60 and height 51.
; PLAN: r0=87(x), r1=90(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=134(x), r1=0(y), r2=60(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 76 at center (87, 90).
; PLAN: r0=87(x), r1=90(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 90
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (134, 0) with width 60 and height 51.
; PLAN: r0=134(x), r1=0(y), r2=60(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 0
LDI r2, 60
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
