; DESCRIPTION: Draws a magenta rectangle at (297, 102) with width 82 and height 67.
; PLAN: r0=297(x), r1=102(y), r2=82(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 102
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
