; DESCRIPTION: Draws a black rectangle at (47, 23) with width 114 and height 50.
; PLAN: r0=47(x), r1=23(y), r2=114(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 23
LDI r2, 114
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
