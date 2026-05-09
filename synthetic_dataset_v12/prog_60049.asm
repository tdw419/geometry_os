; DESCRIPTION: Draws a blue rectangle at (3, 110) with width 110 and height 113.
; PLAN: r0=3(x), r1=110(y), r2=110(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 110
LDI r2, 110
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
