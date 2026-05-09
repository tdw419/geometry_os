; DESCRIPTION: Draws a black rectangle at (91, 58) with width 96 and height 113.
; PLAN: r0=91(x), r1=58(y), r2=96(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 58
LDI r2, 96
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
