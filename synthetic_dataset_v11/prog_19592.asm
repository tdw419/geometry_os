; DESCRIPTION: Draws a yellow rectangle at (107, 134) with width 119 and height 62.
; PLAN: r0=107(x), r1=134(y), r2=119(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 134
LDI r2, 119
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
