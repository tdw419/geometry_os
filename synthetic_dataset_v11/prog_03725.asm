; DESCRIPTION: Draws a magenta rectangle at (56, 47) with width 39 and height 17.
; PLAN: r0=56(x), r1=47(y), r2=39(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 47
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
