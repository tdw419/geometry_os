; DESCRIPTION: Draws a purple rectangle at (239, 39) with width 34 and height 22.
; PLAN: r0=239(x), r1=39(y), r2=34(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 39
LDI r2, 34
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
