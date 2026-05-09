; DESCRIPTION: Draws a blue rectangle at (29, 4) with width 32 and height 43.
; PLAN: r0=29(x), r1=4(y), r2=32(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 4
LDI r2, 32
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
