; DESCRIPTION: Draws a red rectangle at (96, 159) with width 66 and height 67.
; PLAN: r0=96(x), r1=159(y), r2=66(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 159
LDI r2, 66
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
