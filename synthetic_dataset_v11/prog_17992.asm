; DESCRIPTION: Draws a blue rectangle at (173, 183) with width 15 and height 39.
; PLAN: r0=173(x), r1=183(y), r2=15(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 183
LDI r2, 15
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
