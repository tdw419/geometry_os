; DESCRIPTION: Draws a magenta rectangle at (86, 132) with width 114 and height 42.
; PLAN: r0=86(x), r1=132(y), r2=114(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 132
LDI r2, 114
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
