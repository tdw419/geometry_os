; DESCRIPTION: Draws a yellow rectangle at (228, 49) with width 49 and height 67.
; PLAN: r0=228(x), r1=49(y), r2=49(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 49
LDI r2, 49
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
