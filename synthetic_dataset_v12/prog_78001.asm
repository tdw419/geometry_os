; DESCRIPTION: Draws a red rectangle at (232, 72) with width 66 and height 39.
; PLAN: r0=232(x), r1=72(y), r2=66(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 72
LDI r2, 66
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
