; DESCRIPTION: Draws a black rectangle at (119, 12) with width 23 and height 113.
; PLAN: r0=119(x), r1=12(y), r2=23(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 12
LDI r2, 23
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
