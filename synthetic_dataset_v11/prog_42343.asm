; DESCRIPTION: Draws a magenta rectangle at (19, 223) with width 102 and height 25.
; PLAN: r0=19(x), r1=223(y), r2=102(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 223
LDI r2, 102
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
