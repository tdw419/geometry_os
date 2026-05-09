; DESCRIPTION: Draws a blue rectangle at (346, 78) with width 15 and height 112.
; PLAN: r0=346(x), r1=78(y), r2=15(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 78
LDI r2, 15
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
