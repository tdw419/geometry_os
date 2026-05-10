; DESCRIPTION: Draws a magenta rectangle at (339, 60) with width 44 and height 109.
; PLAN: r0=339(x), r1=60(y), r2=44(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 60
LDI r2, 44
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
