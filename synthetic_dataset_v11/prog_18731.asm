; DESCRIPTION: Composite: . Then Draws a white rectangle at (115, 29) with width 88 and height 105. Then Places a blue circle of radius 51 at center (179, 114).
; PLAN: r0=115(x), r1=29(y), r2=88(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x), r1=114(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (115, 29) with width 88 and height 105.
; PLAN: r0=115(x), r1=29(y), r2=88(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 29
LDI r2, 88
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 51 at center (179, 114).
; PLAN: r0=179(x), r1=114(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 114
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
