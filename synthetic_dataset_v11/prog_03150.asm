; DESCRIPTION: Draws a blue rectangle at (17, 79) with width 34 and height 63.
; PLAN: r0=17(x), r1=79(y), r2=34(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 34
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
