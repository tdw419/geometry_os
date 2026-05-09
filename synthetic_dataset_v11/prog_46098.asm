; DESCRIPTION: Composite: . Then Draws a blue rectangle at (20, 17) with width 81 and height 112. Then Places a purple circle of radius 11 at center (95, 43).
; PLAN: r0=20(x), r1=17(y), r2=81(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=95(x), r1=43(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (20, 17) with width 81 and height 112.
; PLAN: r0=20(x), r1=17(y), r2=81(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 17
LDI r2, 81
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 11 at center (95, 43).
; PLAN: r0=95(x), r1=43(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 43
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
