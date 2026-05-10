; DESCRIPTION: Draws a purple rectangle at (209, 113) with width 59 and height 30.
; PLAN: r0=209(x), r1=113(y), r2=59(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 113
LDI r2, 59
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
