; DESCRIPTION: Draws a red rectangle at (1, 37) with width 67 and height 54.
; PLAN: r0=1(x), r1=37(y), r2=67(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 37
LDI r2, 67
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
