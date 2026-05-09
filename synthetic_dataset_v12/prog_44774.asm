; DESCRIPTION: Draws a yellow rectangle at (338, 113) with width 29 and height 92.
; PLAN: r0=338(x), r1=113(y), r2=29(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 113
LDI r2, 29
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
