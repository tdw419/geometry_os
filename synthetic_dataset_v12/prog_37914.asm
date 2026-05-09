; DESCRIPTION: Draws a blue rectangle at (324, 15) with width 113 and height 105.
; PLAN: r0=324(x), r1=15(y), r2=113(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 15
LDI r2, 113
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
