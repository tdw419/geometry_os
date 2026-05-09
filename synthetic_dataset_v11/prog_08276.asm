; DESCRIPTION: Draws a yellow rectangle at (167, 62) with width 43 and height 72.
; PLAN: r0=167(x), r1=62(y), r2=43(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 62
LDI r2, 43
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
