; DESCRIPTION: Draws a magenta rectangle at (477, 173) with width 31 and height 30.
; PLAN: r0=477(x), r1=173(y), r2=31(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 173
LDI r2, 31
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
