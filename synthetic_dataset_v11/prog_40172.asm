; DESCRIPTION: Draws a magenta rectangle at (105, 24) with width 74 and height 86.
; PLAN: r0=105(x), r1=24(y), r2=74(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 24
LDI r2, 74
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
