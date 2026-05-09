; DESCRIPTION: Composite: . Then Renders a purple disk with center (109, 96) and radius 25. Then Draws a yellow rectangle at (23, 51) with width 60 and height 12.
; PLAN: r0=109(x), r1=96(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=51(y), r2=60(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (109, 96) and radius 25.
; PLAN: r0=109(x), r1=96(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 96
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (23, 51) with width 60 and height 12.
; PLAN: r0=23(x), r1=51(y), r2=60(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 51
LDI r2, 60
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
