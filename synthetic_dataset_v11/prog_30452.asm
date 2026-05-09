; DESCRIPTION: Draws a white rectangle at (68, 67) with width 84 and height 66.
; PLAN: r0=68(x), r1=67(y), r2=84(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 67
LDI r2, 84
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
