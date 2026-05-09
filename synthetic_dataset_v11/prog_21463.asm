; DESCRIPTION: Composite: . Then Renders a black disk with center (190, 145) and radius 40. Then Draws a blue rectangle at (32, 216) with width 105 and height 28.
; PLAN: r0=190(x), r1=145(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=32(x), r1=216(y), r2=105(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (190, 145) and radius 40.
; PLAN: r0=190(x), r1=145(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 145
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (32, 216) with width 105 and height 28.
; PLAN: r0=32(x), r1=216(y), r2=105(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 216
LDI r2, 105
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
