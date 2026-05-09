; DESCRIPTION: Draws a magenta rectangle at (167, 167) with width 72 and height 17.
; PLAN: r0=167(x), r1=167(y), r2=72(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 167
LDI r2, 72
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
