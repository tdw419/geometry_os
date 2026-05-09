; DESCRIPTION: Draws a black rectangle at (122, 144) with width 113 and height 38.
; PLAN: r0=122(x), r1=144(y), r2=113(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 144
LDI r2, 113
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
