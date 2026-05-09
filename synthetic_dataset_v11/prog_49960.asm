; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (118, 72) with width 87 and height 63. Then Renders a black disk with center (187, 158) and radius 67.
; PLAN: r0=118(x), r1=72(y), r2=87(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x), r1=158(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (118, 72) with width 87 and height 63.
; PLAN: r0=118(x), r1=72(y), r2=87(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 72
LDI r2, 87
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (187, 158) and radius 67.
; PLAN: r0=187(x), r1=158(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 158
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
