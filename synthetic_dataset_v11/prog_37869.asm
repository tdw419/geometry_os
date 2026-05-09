; DESCRIPTION: Draws a magenta rectangle at (47, 28) with width 57 and height 59.
; PLAN: r0=47(x), r1=28(y), r2=57(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 28
LDI r2, 57
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
