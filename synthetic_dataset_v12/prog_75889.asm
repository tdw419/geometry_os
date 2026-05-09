; DESCRIPTION: Draws a black rectangle at (109, 125) with width 35 and height 113.
; PLAN: r0=109(x), r1=125(y), r2=35(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 125
LDI r2, 35
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
