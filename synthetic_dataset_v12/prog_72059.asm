; DESCRIPTION: Draws a red rectangle at (348, 123) with width 67 and height 116.
; PLAN: r0=348(x), r1=123(y), r2=67(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 123
LDI r2, 67
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
