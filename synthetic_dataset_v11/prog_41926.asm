; DESCRIPTION: Draws a red rectangle at (123, 126) with width 34 and height 67.
; PLAN: r0=123(x), r1=126(y), r2=34(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 126
LDI r2, 34
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
