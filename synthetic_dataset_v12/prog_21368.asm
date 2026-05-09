; DESCRIPTION: Draws a magenta rectangle at (81, 27) with width 83 and height 105.
; PLAN: r0=81(x), r1=27(y), r2=83(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 27
LDI r2, 83
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
