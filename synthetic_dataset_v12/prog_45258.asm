; DESCRIPTION: Draws a blue rectangle at (111, 83) with width 113 and height 79.
; PLAN: r0=111(x), r1=83(y), r2=113(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 83
LDI r2, 113
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
