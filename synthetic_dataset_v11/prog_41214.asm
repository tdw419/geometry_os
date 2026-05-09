; DESCRIPTION: Draws a green rectangle at (63, 67) with width 65 and height 67.
; PLAN: r0=63(x), r1=67(y), r2=65(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 67
LDI r2, 65
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
