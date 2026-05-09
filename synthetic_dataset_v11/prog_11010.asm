; DESCRIPTION: Draws a blue rectangle at (47, 132) with width 113 and height 60.
; PLAN: r0=47(x), r1=132(y), r2=113(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 132
LDI r2, 113
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
