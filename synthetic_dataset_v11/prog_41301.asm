; DESCRIPTION: Composite: . Then Draws a blue rectangle at (218, 83) with width 18 and height 93. Then Renders a white disk with center (114, 145) and radius 80.
; PLAN: r0=218(x), r1=83(y), r2=18(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x), r1=145(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (218, 83) with width 18 and height 93.
; PLAN: r0=218(x), r1=83(y), r2=18(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 83
LDI r2, 18
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (114, 145) and radius 80.
; PLAN: r0=114(x), r1=145(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 145
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
