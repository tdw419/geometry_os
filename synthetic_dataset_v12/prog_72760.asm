; DESCRIPTION: Draws a red rectangle at (67, 121) with width 77 and height 106.
; PLAN: r0=67(x), r1=121(y), r2=77(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 121
LDI r2, 77
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
