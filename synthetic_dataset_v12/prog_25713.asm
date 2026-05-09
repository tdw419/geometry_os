; DESCRIPTION: Draws a green rectangle at (101, 159) with width 104 and height 81.
; PLAN: r0=101(x), r1=159(y), r2=104(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 159
LDI r2, 104
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
