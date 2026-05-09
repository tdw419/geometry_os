; DESCRIPTION: Draws a purple rectangle at (239, 79) with width 13 and height 38.
; PLAN: r0=239(x), r1=79(y), r2=13(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 79
LDI r2, 13
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
