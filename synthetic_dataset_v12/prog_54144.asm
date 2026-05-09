; DESCRIPTION: Draws a magenta rectangle at (382, 57) with width 71 and height 26.
; PLAN: r0=382(x), r1=57(y), r2=71(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 57
LDI r2, 71
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
