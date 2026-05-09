; DESCRIPTION: Composite: . Then Draws a green rectangle at (41, 137) with width 118 and height 61. Then Draws a black circle centered at (72, 137) with radius 65.
; PLAN: r0=41(x), r1=137(y), r2=118(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x), r1=137(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (41, 137) with width 118 and height 61.
; PLAN: r0=41(x), r1=137(y), r2=118(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 137
LDI r2, 118
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (72, 137) with radius 65.
; PLAN: r0=72(x), r1=137(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 137
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
