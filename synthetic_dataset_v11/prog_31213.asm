; DESCRIPTION: Draws a red rectangle at (111, 203) with width 51 and height 29.
; PLAN: r0=111(x), r1=203(y), r2=51(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 203
LDI r2, 51
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
