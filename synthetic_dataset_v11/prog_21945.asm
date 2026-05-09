; DESCRIPTION: Draws a black rectangle at (113, 1) with width 14 and height 61.
; PLAN: r0=113(x), r1=1(y), r2=14(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 1
LDI r2, 14
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
