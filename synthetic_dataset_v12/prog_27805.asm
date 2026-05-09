; DESCRIPTION: Draws a blue rectangle at (352, 8) with width 15 and height 47.
; PLAN: r0=352(x), r1=8(y), r2=15(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 8
LDI r2, 15
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
