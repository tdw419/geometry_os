; DESCRIPTION: Draws a green rectangle at (67, 116) with width 114 and height 103.
; PLAN: r0=67(x), r1=116(y), r2=114(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 116
LDI r2, 114
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
