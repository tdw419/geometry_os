; DESCRIPTION: Draws a red rectangle at (11, 96) with width 81 and height 113.
; PLAN: r0=11(x), r1=96(y), r2=81(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 96
LDI r2, 81
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
