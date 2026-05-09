; DESCRIPTION: Composite: . Then Renders a blue disk with center (136, 152) and radius 42. Then Draws a blue rectangle at (118, 107) with width 18 and height 49.
; PLAN: r0=136(x), r1=152(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=118(x), r1=107(y), r2=18(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (136, 152) and radius 42.
; PLAN: r0=136(x), r1=152(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 152
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (118, 107) with width 18 and height 49.
; PLAN: r0=118(x), r1=107(y), r2=18(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 107
LDI r2, 18
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
