; DESCRIPTION: Draws a magenta rectangle at (213, 61) with width 21 and height 69.
; PLAN: r0=213(x), r1=61(y), r2=21(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 61
LDI r2, 21
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
