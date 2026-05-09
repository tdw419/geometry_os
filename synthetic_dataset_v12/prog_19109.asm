; DESCRIPTION: Draws a red rectangle at (217, 8) with width 67 and height 116.
; PLAN: r0=217(x), r1=8(y), r2=67(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 8
LDI r2, 67
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
