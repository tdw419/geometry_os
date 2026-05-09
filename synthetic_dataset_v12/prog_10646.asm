; DESCRIPTION: Draws a black rectangle at (319, 67) with width 33 and height 30.
; PLAN: r0=319(x), r1=67(y), r2=33(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 67
LDI r2, 33
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
