; DESCRIPTION: Draws a red rectangle at (301, 67) with width 10 and height 62.
; PLAN: r0=301(x), r1=67(y), r2=10(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 67
LDI r2, 10
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
