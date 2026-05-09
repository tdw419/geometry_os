; DESCRIPTION: Draws a magenta rectangle at (35, 151) with width 34 and height 31.
; PLAN: r0=35(x), r1=151(y), r2=34(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 151
LDI r2, 34
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
