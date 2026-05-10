; DESCRIPTION: Draws a black rectangle at (115, 68) with width 37 and height 67.
; PLAN: r0=115(x), r1=68(y), r2=37(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 68
LDI r2, 37
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
