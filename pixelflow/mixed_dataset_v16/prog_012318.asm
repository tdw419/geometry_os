; DESCRIPTION: Draws a red rectangle at (22, 45) with width 113 and height 67.
; PLAN: r0=22(x), r1=45(y), r2=113(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 45
LDI r2, 113
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
