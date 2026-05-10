; DESCRIPTION: Draws a red rectangle at (74, 210) with width 113 and height 35.
; PLAN: r0=74(x), r1=210(y), r2=113(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 210
LDI r2, 113
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
