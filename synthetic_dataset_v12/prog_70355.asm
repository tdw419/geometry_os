; DESCRIPTION: Draws a blue rectangle at (47, 49) with width 47 and height 24.
; PLAN: r0=47(x), r1=49(y), r2=47(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 49
LDI r2, 47
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
