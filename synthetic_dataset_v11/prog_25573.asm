; DESCRIPTION: Composite: . Then Places a black circle of radius 68 at center (132, 70). Then Draws a blue rectangle at (6, 147) with width 65 and height 66.
; PLAN: r0=132(x), r1=70(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=6(x), r1=147(y), r2=65(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 68 at center (132, 70).
; PLAN: r0=132(x), r1=70(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 70
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (6, 147) with width 65 and height 66.
; PLAN: r0=6(x), r1=147(y), r2=65(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 147
LDI r2, 65
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
