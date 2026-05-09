; DESCRIPTION: Draws a magenta rectangle at (17, 56) with width 65 and height 39.
; PLAN: r0=17(x), r1=56(y), r2=65(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 56
LDI r2, 65
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
