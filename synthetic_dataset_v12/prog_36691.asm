; DESCRIPTION: Draws a black rectangle at (378, 67) with width 75 and height 63.
; PLAN: r0=378(x), r1=67(y), r2=75(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 67
LDI r2, 75
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
