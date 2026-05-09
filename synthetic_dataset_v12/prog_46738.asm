; DESCRIPTION: Draws a magenta rectangle at (107, 2) with width 28 and height 108.
; PLAN: r0=107(x), r1=2(y), r2=28(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 2
LDI r2, 28
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
