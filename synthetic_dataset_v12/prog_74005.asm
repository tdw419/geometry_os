; DESCRIPTION: Draws a blue rectangle at (98, 22) with width 113 and height 98.
; PLAN: r0=98(x), r1=22(y), r2=113(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 22
LDI r2, 113
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
