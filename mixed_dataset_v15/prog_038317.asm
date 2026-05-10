; DESCRIPTION: Draws a blue rectangle at (174, 103) with width 67 and height 113.
; PLAN: r0=174(x), r1=103(y), r2=67(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 103
LDI r2, 67
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
