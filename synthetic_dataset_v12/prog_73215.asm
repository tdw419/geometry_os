; DESCRIPTION: Draws a blue rectangle at (209, 15) with width 28 and height 30.
; PLAN: r0=209(x), r1=15(y), r2=28(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 15
LDI r2, 28
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
