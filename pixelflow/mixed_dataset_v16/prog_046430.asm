; DESCRIPTION: Draws a black rectangle at (167, 84) with width 92 and height 13.
; PLAN: r0=167(x), r1=84(y), r2=92(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 84
LDI r2, 92
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
