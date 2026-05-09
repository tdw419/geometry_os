; DESCRIPTION: Draws a black rectangle at (75, 84) with width 69 and height 113.
; PLAN: r0=75(x), r1=84(y), r2=69(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 84
LDI r2, 69
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
