; DESCRIPTION: Draws a red rectangle at (232, 77) with width 113 and height 96.
; PLAN: r0=232(x), r1=77(y), r2=113(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 77
LDI r2, 113
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
