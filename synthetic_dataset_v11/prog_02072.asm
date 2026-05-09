; DESCRIPTION: Draws a magenta rectangle at (127, 37) with width 37 and height 61.
; PLAN: r0=127(x), r1=37(y), r2=37(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 37
LDI r2, 37
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
