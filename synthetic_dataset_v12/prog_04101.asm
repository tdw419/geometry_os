; DESCRIPTION: Draws a magenta rectangle at (299, 4) with width 30 and height 68.
; PLAN: r0=299(x), r1=4(y), r2=30(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 4
LDI r2, 30
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
