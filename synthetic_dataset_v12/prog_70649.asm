; DESCRIPTION: Draws a blue rectangle at (67, 131) with width 39 and height 19.
; PLAN: r0=67(x), r1=131(y), r2=39(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 131
LDI r2, 39
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
