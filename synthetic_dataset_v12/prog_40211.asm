; DESCRIPTION: Draws a black rectangle at (207, 222) with width 74 and height 26.
; PLAN: r0=207(x), r1=222(y), r2=74(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 222
LDI r2, 74
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
