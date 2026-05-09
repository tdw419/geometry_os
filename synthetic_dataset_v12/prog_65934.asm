; DESCRIPTION: Draws a red rectangle at (279, 113) with width 109 and height 66.
; PLAN: r0=279(x), r1=113(y), r2=109(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 113
LDI r2, 109
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
