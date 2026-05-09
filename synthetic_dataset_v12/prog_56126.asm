; DESCRIPTION: Draws a green rectangle at (316, 103) with width 57 and height 119.
; PLAN: r0=316(x), r1=103(y), r2=57(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 103
LDI r2, 57
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
