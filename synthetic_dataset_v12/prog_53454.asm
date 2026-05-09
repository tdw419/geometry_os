; DESCRIPTION: Draws a black rectangle at (282, 40) with width 17 and height 16.
; PLAN: r0=282(x), r1=40(y), r2=17(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 40
LDI r2, 17
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
