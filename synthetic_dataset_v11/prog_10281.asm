; DESCRIPTION: Draws a red rectangle at (23, 109) with width 67 and height 62.
; PLAN: r0=23(x), r1=109(y), r2=67(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 109
LDI r2, 67
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
