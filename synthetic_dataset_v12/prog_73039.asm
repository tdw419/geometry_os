; DESCRIPTION: Draws a red rectangle at (466, 67) with width 28 and height 84.
; PLAN: r0=466(x), r1=67(y), r2=28(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 67
LDI r2, 28
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
