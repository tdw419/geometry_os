; DESCRIPTION: Draws a black rectangle at (118, 32) with width 107 and height 62.
; PLAN: r0=118(x), r1=32(y), r2=107(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 32
LDI r2, 107
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
