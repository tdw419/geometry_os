; DESCRIPTION: Draws a blue rectangle at (330, 151) with width 25 and height 67.
; PLAN: r0=330(x), r1=151(y), r2=25(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 151
LDI r2, 25
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
