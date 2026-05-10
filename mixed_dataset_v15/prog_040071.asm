; DESCRIPTION: Draws a yellow rectangle at (126, 83) with width 81 and height 67.
; PLAN: r0=126(x), r1=83(y), r2=81(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 83
LDI r2, 81
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
