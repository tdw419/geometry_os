; DESCRIPTION: Draws a black rectangle at (246, 47) with width 65 and height 67.
; PLAN: r0=246(x), r1=47(y), r2=65(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 47
LDI r2, 65
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
