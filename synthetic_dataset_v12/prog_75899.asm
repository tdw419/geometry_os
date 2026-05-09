; DESCRIPTION: Draws a black rectangle at (113, 44) with width 67 and height 103.
; PLAN: r0=113(x), r1=44(y), r2=67(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 44
LDI r2, 67
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
