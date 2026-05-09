; DESCRIPTION: Draws a magenta rectangle at (54, 107) with width 73 and height 38.
; PLAN: r0=54(x), r1=107(y), r2=73(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 107
LDI r2, 73
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
