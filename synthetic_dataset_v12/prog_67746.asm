; DESCRIPTION: Draws a blue rectangle at (46, 67) with width 76 and height 66.
; PLAN: r0=46(x), r1=67(y), r2=76(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 67
LDI r2, 76
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
