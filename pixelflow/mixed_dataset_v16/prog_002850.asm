; DESCRIPTION: Draws a magenta rectangle at (171, 133) with width 67 and height 112.
; PLAN: r0=171(x), r1=133(y), r2=67(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 133
LDI r2, 67
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
