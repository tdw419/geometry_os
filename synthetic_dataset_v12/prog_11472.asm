; DESCRIPTION: Draws a black rectangle at (65, 151) with width 13 and height 100.
; PLAN: r0=65(x), r1=151(y), r2=13(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 151
LDI r2, 13
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
