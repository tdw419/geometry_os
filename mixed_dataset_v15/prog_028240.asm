; DESCRIPTION: Draws a blue rectangle at (239, 116) with width 66 and height 114.
; PLAN: r0=239(x), r1=116(y), r2=66(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 116
LDI r2, 66
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
