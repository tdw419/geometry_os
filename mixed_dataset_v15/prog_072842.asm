; DESCRIPTION: Draws a red rectangle at (30, 90) with width 81 and height 67.
; PLAN: r0=30(x), r1=90(y), r2=81(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 90
LDI r2, 81
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
