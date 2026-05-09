; DESCRIPTION: Draws a blue rectangle at (266, 74) with width 72 and height 62.
; PLAN: r0=266(x), r1=74(y), r2=72(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 74
LDI r2, 72
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
