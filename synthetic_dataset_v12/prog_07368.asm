; DESCRIPTION: Draws a black rectangle at (183, 15) with width 16 and height 119.
; PLAN: r0=183(x), r1=15(y), r2=16(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 15
LDI r2, 16
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
