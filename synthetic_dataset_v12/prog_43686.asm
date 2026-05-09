; DESCRIPTION: Draws a magenta rectangle at (207, 46) with width 97 and height 28.
; PLAN: r0=207(x), r1=46(y), r2=97(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 46
LDI r2, 97
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
