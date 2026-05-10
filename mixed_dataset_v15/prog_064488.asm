; DESCRIPTION: Draws a magenta rectangle at (383, 126) with width 30 and height 109.
; PLAN: r0=383(x), r1=126(y), r2=30(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 126
LDI r2, 30
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
