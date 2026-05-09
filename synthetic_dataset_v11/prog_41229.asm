; DESCRIPTION: Draws a yellow rectangle at (167, 103) with width 28 and height 62.
; PLAN: r0=167(x), r1=103(y), r2=28(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 103
LDI r2, 28
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
