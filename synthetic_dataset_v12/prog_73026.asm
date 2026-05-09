; DESCRIPTION: Draws a magenta rectangle at (76, 67) with width 82 and height 116.
; PLAN: r0=76(x), r1=67(y), r2=82(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 67
LDI r2, 82
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
