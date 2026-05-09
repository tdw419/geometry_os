; DESCRIPTION: Draws a red rectangle at (111, 15) with width 62 and height 67.
; PLAN: r0=111(x), r1=15(y), r2=62(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 15
LDI r2, 62
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
