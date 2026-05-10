; DESCRIPTION: Draws a magenta rectangle at (29, 18) with width 12 and height 102.
; PLAN: r0=29(x), r1=18(y), r2=12(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 18
LDI r2, 12
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
