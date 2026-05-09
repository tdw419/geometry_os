; DESCRIPTION: Composite: . Then Renders a red disk with center (115, 162) and radius 15. Then Draws a green rectangle at (101, 20) with width 110 and height 118.
; PLAN: r0=115(x), r1=162(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x), r1=20(y), r2=110(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (115, 162) and radius 15.
; PLAN: r0=115(x), r1=162(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 162
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (101, 20) with width 110 and height 118.
; PLAN: r0=101(x), r1=20(y), r2=110(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 20
LDI r2, 110
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
