; DESCRIPTION: Draws a blue rectangle at (182, 9) with width 99 and height 67.
; PLAN: r0=182(x), r1=9(y), r2=99(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 9
LDI r2, 99
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
