; DESCRIPTION: Draws a black rectangle at (113, 230) with width 73 and height 13.
; PLAN: r0=113(x), r1=230(y), r2=73(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 230
LDI r2, 73
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
