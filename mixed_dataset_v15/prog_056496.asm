; DESCRIPTION: Draws a red rectangle at (28, 113) with width 81 and height 112.
; PLAN: r0=28(x), r1=113(y), r2=81(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 113
LDI r2, 81
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
