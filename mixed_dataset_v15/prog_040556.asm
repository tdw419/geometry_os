; DESCRIPTION: Draws a blue rectangle at (43, 204) with width 96 and height 43.
; PLAN: r0=43(x), r1=204(y), r2=96(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 204
LDI r2, 96
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
