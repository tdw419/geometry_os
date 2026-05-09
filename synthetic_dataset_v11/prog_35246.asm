; DESCRIPTION: Draws a yellow rectangle at (137, 116) with width 82 and height 67.
; PLAN: r0=137(x), r1=116(y), r2=82(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 116
LDI r2, 82
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
