; DESCRIPTION: Draws a magenta rectangle at (72, 40) with width 74 and height 86.
; PLAN: r0=72(x), r1=40(y), r2=74(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 40
LDI r2, 74
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
