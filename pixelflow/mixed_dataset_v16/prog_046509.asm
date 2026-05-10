; DESCRIPTION: Draws a magenta rectangle at (9, 131) with width 74 and height 28.
; PLAN: r0=9(x), r1=131(y), r2=74(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 131
LDI r2, 74
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
