; DESCRIPTION: Draws a black rectangle at (270, 67) with width 59 and height 40.
; PLAN: r0=270(x), r1=67(y), r2=59(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 67
LDI r2, 59
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
