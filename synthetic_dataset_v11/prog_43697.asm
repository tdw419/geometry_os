; DESCRIPTION: Draws a black rectangle at (183, 4) with width 50 and height 62.
; PLAN: r0=183(x), r1=4(y), r2=50(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 4
LDI r2, 50
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
