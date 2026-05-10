; DESCRIPTION: Draws a red rectangle at (53, 113) with width 99 and height 49.
; PLAN: r0=53(x), r1=113(y), r2=99(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 113
LDI r2, 99
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
