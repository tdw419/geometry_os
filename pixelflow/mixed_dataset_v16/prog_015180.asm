; DESCRIPTION: Draws a red rectangle at (101, 30) with width 67 and height 98.
; PLAN: r0=101(x), r1=30(y), r2=67(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 30
LDI r2, 67
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
